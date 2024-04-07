import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  String uid;
  String name;
  String email;
  String drivingLicenseNumber;
  String busNumber;

  String? password;
  String imageUrl;

  DriverModel({
    required this.uid,
    required this.name,
    required this.drivingLicenseNumber,
    required this.busNumber,
    required this.email,
    required this.imageUrl,
    this.password,
  });

  factory DriverModel.fromJson(DocumentSnapshot documentSnapshot) {
    var json = documentSnapshot.data() as Map<String, dynamic>;
    return DriverModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        drivingLicenseNumber: json['drivingLicenseNumber'],
        busNumber: json['busNumber'],
        imageUrl: json['imageUrl'],
        password: json['password']);
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'drivingLicenseNumber': drivingLicenseNumber,
      'busNumber': busNumber,
      'imageUrl': imageUrl,
      'password': password,
    };
  }
}
