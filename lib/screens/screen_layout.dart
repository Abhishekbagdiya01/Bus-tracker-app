import 'package:bus_tracker/utils/global_variables.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bottomNavBarItems.elementAt(_index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _index == 0 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _index == 1 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.route,
                color: _index == 2 ? Colors.black : Colors.grey,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _index == 3 ? Colors.black : Colors.grey,
              ),
              label: ""),
        ],
      ),
    );
  }
}
