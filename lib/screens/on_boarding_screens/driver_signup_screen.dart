import 'package:bus_tracker/models/driver_model.dart';
import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/screens/driver_home_screen.dart';
import 'package:bus_tracker/screens/on_boarding_screens/driver_login_screen.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:bus_tracker/widgets/custom_text_field.dart';
import 'package:bus_tracker/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController drivingLicNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List bus = ["B1", "B2", "B3", "B4"];
  String selectedBus = "B1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Track N Go",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
            ),
            CustomTextField(
                controller: nameController,
                hintText: "Name",
                iconData: Icons.mail,
                isHide: false),
            SizedBox(height: 10),
            CustomTextField(
                controller: emailController,
                hintText: "Email",
                iconData: Icons.mail,
                isHide: false),
            SizedBox(height: 10),
            CustomTextField(
                controller: drivingLicNumberController,
                hintText: "Driving License",
                keyboardType: TextInputType.number,
                iconData: Icons.credit_card,
                isHide: false),
            SizedBox(height: 10),
            SizedBox(
              width: 100,
              child: DropdownButton(
                value: selectedBus,
                items: bus
                    .map(
                      (value) => DropdownMenuItem(
                        child: Text(
                          value.toString(),
                        ),
                        value: value,
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedBus = value.toString();
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(
                controller: passwordController,
                hintText: "Password",
                iconData: Icons.password,
                isHide: true),
            SizedBox(height: 10),
            CustomButton(
              height: 50,
              width: MediaQuery.sizeOf(context).width * .4,
              label: "Sign Up",
              onClicked: () async {
                if (emailController.text.trim().isNotEmpty &&
                    nameController.text.trim().isNotEmpty &&
                    selectedBus.isNotEmpty &&
                    drivingLicNumberController.text.trim().isNotEmpty &&
                    passwordController.text.trim().isNotEmpty) {
                  DriverModel driverModel = DriverModel(
                      uid: "",
                      name: nameController.text,
                      drivingLicenseNumber: drivingLicNumberController.text,
                      busNumber: selectedBus,
                      email: emailController.text,
                      imageUrl: "",
                      password: passwordController.text);
                  String response = await DriverAuthRepository()
                      .createDriverAccount(driverModel);

                  if (response == "success") {
                    snackbarMessenger(context, "Account created successfully");

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
                  // log("${nameController.text} ||${emailController.text} ||${drivingLicNumberController.text} ||${routeController.text}");
                  snackbarMessenger(context, "field cannot be empty");
                }
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an Account?",
                    style: TextStyle(fontSize: 16)),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
