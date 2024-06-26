import 'package:bus_tracker/repository/driver_auth_repository.dart';
import 'package:bus_tracker/screens/profile_screens/about_us_screen.dart';
import 'package:bus_tracker/screens/on_boarding_screens/splash_screen.dart';
import 'package:bus_tracker/screens/profile_screens/privacy_policy_screen.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Track-N-Go"),
      ),
      body: ListView(
        children: [
          Image.asset(
            "assets/images/user_logo.png",
            height: 200,
          ),
          SizedBox(
            height: 10,
          ),
          name != null
              ? Center(
                  child: Text(
                    name!,
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : CircularProgressIndicator(),
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
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(
              "Contect us",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.file_copy),
            title: Text(
              "Privacy Policy",
              style: TextStyle(fontSize: 15.0),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicyScreen(),
                  ));
            },
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
