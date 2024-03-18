import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/screens/driver_home_screen.dart';
import 'package:bus_tracker/screens/on_boarding_screens/driver_forgot_password_screen.dart';
import 'package:bus_tracker/screens/on_boarding_screens/driver_signup_screen.dart';
import 'package:bus_tracker/utils/shared_pref.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:bus_tracker/widgets/custom_text_field.dart';
import 'package:bus_tracker/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
            ),
            CustomTextField(
                controller: emailController,
                hintText: "Email",
                iconData: Icons.mail,
                isHide: false),
            SizedBox(height: 20),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                iconData: Icons.password,
                isHide: true),
            SizedBox(height: 20),
            CustomButton(
                height: MediaQuery.sizeOf(context).height * .07,
                width: MediaQuery.sizeOf(context).width * .6,
                label: "Login",
                onClicked: () async {
                  if (emailController.text.trim().isNotEmpty &&
                      passwordController.text.trim().isNotEmpty) {
                    String response = await DriverAuthRepository()
                        .login(emailController.text, passwordController.text);
                    if (response == "success") {
                      snackbarMessenger(context, "Login success");

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverHomeScreen(),
                          ),
                          (route) => false);
                    } else {
                      snackbarMessenger(context, "${response}");
                    }
                  } else {
                    snackbarMessenger(context, "field cannot be empty");
                  }
                }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an Account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
