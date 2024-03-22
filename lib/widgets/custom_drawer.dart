import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/screens/driver_edit_profile.dart';
import 'package:bus_tracker/screens/on_boarding_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import '../utils/shared_pref.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  final String? name;
  final String? imageUrl;

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
                  imageUrl != ""
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            imageUrl!,
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
                        "${name}",
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
                                    name: name!,
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
              showDialog(
                context: context,
                builder: (context) => AboutDialog(),
              );
            },
            leading: Icon(Icons.info),
            title: Text(
              "About",
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
