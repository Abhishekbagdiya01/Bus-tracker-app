import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:bus_tracker/utils/shared_pref.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  getUsername() async {
    name = await SharedPref().getUserName();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 165.0,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Image.asset(
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
            leading: Icon(Icons.file_copy),
            title: Text(
              "T&C",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          ListTile(
            onTap: () {
              SharedPref().setUserName("");
              DriverAuthRepository().logout();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OnBoardingScreen()));
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
