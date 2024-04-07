import 'dart:typed_data';
import 'package:bus_tracker/models/driver_model.dart';
import 'package:bus_tracker/repository/firestore_repository.dart';
import 'package:bus_tracker/screens/driver_home_screen.dart';
import 'package:bus_tracker/utils/image_picker.dart';
import 'package:bus_tracker/widgets/custom_button.dart';
import 'package:bus_tracker/widgets/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({required this.driverModel, super.key});
  DriverModel driverModel;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    // String uid = FirebaseAuth.instance.currentUser!.uid;
    nameController.text = widget.driverModel.name;
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Pick image from"),
                    actions: [
                      IconButton(
                          onPressed: () async {
                            image = await pickImage(ImageSource.camera);

                            Navigator.pop(context);
                            setState(() {});
                          },
                          icon: Icon(Icons.camera_alt)),
                      IconButton(
                          onPressed: () async {
                            image = await pickImage(ImageSource.gallery);
                            Navigator.pop(context);
                            setState(() {});
                          },
                          icon: Icon(Icons.photo))
                    ],
                  ),
                );
              },
              child: image == null
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          NetworkImage(widget.driverModel.imageUrl.toString()))
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
              onClicked: () async {
                if (nameController.text.trim().isNotEmpty) {
                  DriverModel driverModel = DriverModel(
                      uid: widget.driverModel.uid,
                      name: nameController.text,
                      drivingLicenseNumber:
                          widget.driverModel.drivingLicenseNumber,
                      busNumber: widget.driverModel.busNumber,
                      email: widget.driverModel.email,
                      imageUrl: widget.driverModel.imageUrl);
                  await FireStoreRepository()
                      .editProfile(driverModel: driverModel, image: image);
                  snackbarMessenger(context, "Profile updated");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverHomeScreen(),
                      ),
                      (route) => false);
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
