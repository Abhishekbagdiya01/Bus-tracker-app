import 'package:bus_tracker/models/driver_model.dart';
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
      {required String route, required String lat, required String lng}) async {
    _firestore
        .collection("location")
        .doc(route)
        .set({"lat": lat, "lng": lng, "Route": route});
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDriverPosition(route) async {
    final driverLocation = await _firestore
        .collection('location')
        .where("Route", isEqualTo: route)
        .get();
    return driverLocation;
  }
}
