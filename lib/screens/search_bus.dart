import 'package:bus_tracker/screens/detailed_route_screen.dart';
import 'package:bus_tracker/utils/map_routes.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List optionSearch = [
    "Mandore",
    "Kishor bag",
    "krishi mandi",
    "Bhadwasiya fatak",
    " Maha mamdir",
    "Paota circle",
    "Nai sarak",
    "Railway Station",
    "Jalori gate",
    "5th road",
    "Bombay motors",
    "Akhliya circle",
    "Chaupasni housing board"
  ];

  String source = "Mandore";
  String destination = "Chaupasni housing board";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search bus"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: source,
              items: optionSearch
                  .map((value) => DropdownMenuItem(
                      value: value, child: Text(value.toString())))
                  .toList(),
              onChanged: (value) {
                source = value.toString();
                setState(() {});
              },
            ),
            DropdownButton(
              value: destination,
              items: optionSearch
                  .map((value) => DropdownMenuItem(
                      value: value, child: Text(value.toString())))
                  .toList(),
              onChanged: (value) {
                source = value.toString();
                setState(() {});
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedRoute(
                            busNo: "Bus No 4",
                            busRoute: "Mandore to Chaupasani",
                            routeStops: route4Stops),
                      ));
                },
                child: Text("Search"))
          ],
        ),
      ),
    );
  }
}
