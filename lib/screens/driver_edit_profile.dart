import 'dart:typed_data';
import 'package:bus_tracker/repository/firestore_repository.dart';
import 'package:bus_tracker/screens/driver_home_screen.dart';
import 'package:bus_tracker/utils/image_picker.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({required this.name, super.key});
  String name;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  Uint8List? image;
  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    nameController.text = widget.name;
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                image = await pickImage(ImageSource.gallery);
                setState(() {});
              },
              child: image == null
                  ? CircleAvatar(
                      radius: 100,
                    )
                  : CircleAvatar(
                      radius: 100, backgroundImage: MemoryImage(image!)),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(label: Text("Name")),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              height: 50,
              width: MediaQuery.sizeOf(context).width * 0.4,
              label: "Save",
              onClicked: () {
                FireStoreRepository().editProfile(
                    uid: uid, image: image!, name: nameController.text);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DriverHomeScreen(),
                    ),
                    (route) => true);
              },
            )
          ],
        ),
      ),
    );
  }
}
