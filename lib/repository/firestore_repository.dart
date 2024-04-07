import 'dart:developer';
import 'dart:typed_data';

import 'package:bus_tracker/models/driver_model.dart';
import 'package:bus_tracker/repository/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetching Driver details from firebase firestore
  Future<DriverModel> getDriverDetails(uid) async {
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('drivers').doc(uid).get();

    return DriverModel.fromJson(documentSnapshot);
  }

  Future sendLocationToFireStore(
      {required String busNo, required String lat, required String lng}) async {
    _firestore
        .collection("location")
        .doc(busNo)
        .set({"lat": lat, "lng": lng, "busNumber": busNo});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDriverPosition(busNo) async {
    final driverLocation = await _firestore
        .collection('location')
        .where("busNumber", isEqualTo: busNo)
        .get();
    return driverLocation;
  }

  // Edit profile
  Future editProfile(
      {required DriverModel driverModel, Uint8List? image}) async {
    try {
      if (image == null) {
        await _firestore.collection("drivers").doc(driverModel.uid).update({
          "name": driverModel.name,
        });
      } else {
        String imageUrl = await StorageRepository()
            .uploadImageToStorage(uid: driverModel.uid, file: image);

        await _firestore.collection("drivers").doc(driverModel.uid).update({
          "imageUrl": imageUrl,
          "name": driverModel.name,
        });
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
