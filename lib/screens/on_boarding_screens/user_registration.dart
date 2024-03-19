import 'package:bus_tracker/screens/home_screen.dart';
import 'package:bus_tracker/screens/screen_layout.dart';
import 'package:bus_tracker/utils/shared_pref.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:bus_tracker/widgets/custom_text_field.dart';
import 'package:bus_tracker/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class UserRegistrationScreen extends StatelessWidget {
  UserRegistrationScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Track N Go"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
            ),
            CustomTextField(
                controller: nameController,
                hintText: "Name",
                iconData: Icons.person),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              height: MediaQuery.sizeOf(context).height * .05,
              width: MediaQuery.sizeOf(context).width * .4,
              label: "Next",
              onClicked: () {
                if (nameController.text.isNotEmpty) {
                  SharedPref().setUserName(nameController.text);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenLayout(),
                      ));
                } else {
                  snackbarMessenger(context, "Name cannot be empty");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
