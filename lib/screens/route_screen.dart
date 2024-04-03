import 'package:bus_tracker/screens/detailed_route_screen.dart';
import 'package:bus_tracker/utils/map_routes.dart';
import 'package:flutter/material.dart';

class RouteScreen extends StatelessWidget {
  RouteScreen({super.key});

  List<Map> busList = [
    {"bus": "Bus No 1", "route": "Mandore to Panch Batti"},
    {"bus": "Bus No 2", "route": "Banar to Chaupasani"},
    {"bus": "Bus No 3", "route": "Ghantaghar to Basni"},
    {"bus": "Bus No 4", "route": "Mandore to Chaupasani"},
  ];
  List busRouteStops = [route1Stops, route2Stops, route3Stops, route4Stops];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Routes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: busList.length,
        itemBuilder: (context, index) {
          return Center(
              child: Column(
            children: [
              Card(
                elevation: 4,
                child: Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: ListTile(
                    title: Text(busList[index]["bus"]),
                    subtitle: Text(busList[index]["route"]),
                    trailing: Icon(Icons.arrow_circle_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailedRoute(
                              busNo: busList[index]["bus"],
                              busRoute: busList[index]["route"],
                              routeStops: busRouteStops[index],
                            ),
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ));
        },
      ),
    );
  }
}
