import 'dart:core';

import 'package:bus_tracker/models/driver_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DriverAuthRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //  Sign in with email and password
  Future<String> createDriverAccount(DriverModel driverModel) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: driverModel.email, password: driverModel.password!);

      DriverModel newModel = DriverModel(
          uid: userCredential.user!.uid,
          name: driverModel.name,
          drivingLicenseNumber: driverModel.drivingLicenseNumber,
          busNumber: driverModel.busNumber,
          email: driverModel.email,
          route: driverModel.route,
          imageUrl: "");
      await _firestore
          .collection("drivers")
          .doc(userCredential.user!.uid)
          .set(newModel.toMap());

      return "success";
    } on FirebaseAuthException catch (error) {
      return error.message!;
    }
  }

//  login in with email and password
  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return "success";
    } on FirebaseAuthException catch (error) {
      return error.message!;
    }
  }

  // forgot password
  Future<String> forgotPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
      return "success";
    } on FirebaseAuthException catch (error) {
      return error.message!;
    }
  }

  Future<String> logout() async {
    try {
      await _auth.signOut();
      return "success";
    } on FirebaseAuthException catch (error) {
      return error.message!;
    }
  }
}
