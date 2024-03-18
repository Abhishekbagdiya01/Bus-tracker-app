import 'dart:async';

import 'package:bus_tracker/screens/driver_home_screen.dart';
import 'package:bus_tracker/screens/home_screen.dart';
import 'package:bus_tracker/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:bus_tracker/screens/screen_layout.dart';
import 'package:bus_tracker/utils/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
      checkAuthenticate();
    });
  }

  void checkAuthenticate() async {
    String? name = await SharedPref().getUserName();
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (name != null && name.isNotEmpty) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenLayout(),
          ));
    } else if (uid != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DriverHomeScreen(),
          ));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
