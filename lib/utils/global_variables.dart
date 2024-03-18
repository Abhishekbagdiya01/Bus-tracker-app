import 'package:bus_tracker/screens/home_screen.dart';
import 'package:bus_tracker/screens/profile_screen.dart';
import 'package:bus_tracker/screens/route_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> bottomNavBarItems = [
  HomeScreen(),
  Center(child: Text("Search")),
  RouteScreen(),
  ProfileScreen()
];
