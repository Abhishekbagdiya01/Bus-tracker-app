import 'package:bus_tracker/models/driver_model.dart';
import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/screens/profile_screens/about_us_screen.dart';
import 'package:bus_tracker/screens/profile_screens/driver_edit_profile.dart';
import 'package:bus_tracker/screens/on_boarding_screens/splash_screen.dart';
import 'package:bus_tracker/screens/profile_screens/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import '../utils/shared_pref.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    required this.driverModel,
  });

  DriverModel driverModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 165.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  driverModel.imageUrl != ""
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            driverModel.imageUrl.toString(),
                          ),
                        )
                      : Image.asset(
                          "assets/images/user_logo.png",
                          height: 65.0,
                          width: 65.0,
                        ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${driverModel.name}",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                    driverModel: driverModel,
                                  ),
                                ));
                          },
                          child: Text("Edit Profile")),
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1.0,
            color: Colors.blueGrey,
            thickness: 1.0,
          ),
          SizedBox(
            height: 12.0,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsScreen(),
                  ));
            },
            leading: Icon(Icons.info),
            title: Text(
              "About us",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(),
                  ));
            },
            leading: Icon(Icons.file_copy),
            title: Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          ListTile(
            onTap: () {
              SharedPref().setUserName("");
              DriverAuthRepository().logout();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            },
            leading: Icon(Icons.logout_outlined),
            title: const Text(
              "Logout",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
