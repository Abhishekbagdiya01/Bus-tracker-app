import 'package:bus_tracker/screens/on_boarding_screens/driver_signup_screen.dart';
import 'package:bus_tracker/screens/on_boarding_screens/user_registration.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Track N Go",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              height: MediaQuery.sizeOf(context).height * .07,
              width: MediaQuery.sizeOf(context).width * .6,
              label: "User",
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserRegistrationScreen(),
                    ));
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              height: MediaQuery.sizeOf(context).height * .07,
              width: MediaQuery.sizeOf(context).width * .6,
              label: "Driver",
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
