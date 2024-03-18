import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:bus_tracker/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                controller: emailController,
                hintText: "Email",
                iconData: Icons.mail),
            SizedBox(height: 20),
            CustomButton(
                height: MediaQuery.sizeOf(context).height * .07,
                width: MediaQuery.sizeOf(context).width * .50,
                label: "Reset Password",
                onClicked: () async {
                  if (emailController.text.trim().isNotEmpty) {
                    String response = await DriverAuthRepository()
                        .forgotPassword(emailController.text);
                    if (response == "success") {
                      snackbarMessenger(
                          context, "Email reset link send to your email");
                    } else {
                      snackbarMessenger(
                          context, "Email reset link send to your email");
                    }
                  } else {
                    snackbarMessenger(context, "Email cannot be empty");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
