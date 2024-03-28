import 'package:bus_tracker/screens/home_screen.dart';
import 'package:bus_tracker/screens/search_bus.dart';
import 'package:bus_tracker/screens/profile_screens/profile_screen.dart';
import 'package:bus_tracker/screens/route_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Widget> bottomNavBarItems = [
  HomeScreen(),
  SearchScreen(),
  RouteScreen(),
  ProfileScreen()
];
