import 'dart:async';
import 'dart:developer';
import 'package:bus_tracker/repository/firestore_repository.dart';
import 'package:bus_tracker/utils/map_routes.dart';
import 'package:bus_tracker/utils/shared_pref.dart';
import 'package:bus_tracker/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int selectedRoute = 0;
  List routes = [route1, route2, route3, route4];
  Color routeColor = Colors.blue;
  late Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;
  void getCurrentPosition() async {
    await MapPermission.checkAndRequestLocationPermission();
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    log(" User current location  Lat : ${currentPosition.latitude} || long : ${currentPosition.longitude}");
  }

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.268253, 73.035416),
    zoom: 14.4746,
  );

  String? name = "";

  Map markers = {};
  getUsername() async {
    name = await SharedPref().getUserName();
    setState(() {});
  }

  double? lat;
  double? lng;
  late QuerySnapshot busLocation;
  String route = "R1";
  getBusLocation(route) async {
    var location = await FireStoreRepository().getDriverPosition(route);
    busLocation = location;

    if (location.docs.isNotEmpty) {
      lat = double.parse(location.docs.first.data()["lat"]);
      lng = double.parse(location.docs.first.data()["lng"]);
      log("Bus Location LAT " +
          location.docs.first.data()["lat"].toString() +
          location.docs.first.data()["lng"].toString());
      setState(() {});
    } else {
      lat = 0;
      lng = 0;
      log("No Lat Long founded");
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentPosition();
    super.initState();

    getUsername();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            polylines: {
              Polyline(
                polylineId: PolylineId('route'),
                points: routes[selectedRoute],
                color: routeColor,
                width: 5,
              ),
            },
            markers: {
              Marker(
                  markerId: MarkerId("destination"),
                  position: lat != null ? LatLng(lat!, lng!) : LatLng(0, 0))
            },
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RawChip(
                  label: SizedBox(
                      height: 50,
                      child: Column(children: [
                        Text("Bus 1"),
                        Text("Mandore - Panch bati")
                      ])),
                  onPressed: () {
                    selectedRoute = 0;
                    route = "B1";
                    Timer.periodic(Duration(seconds: 8), (timer) {
                      getBusLocation(route);
                    });
                    routeColor = Colors.blue;
                    log(selectedRoute.toString());
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RawChip(
                  label: SizedBox(
                      height: 50,
                      child: Column(
                          children: [Text("Bus 2"), Text("Banar - CHB")])),
                  onPressed: () {
                    selectedRoute = 1;
                    route = "B2";
                    routeColor = Colors.green;
                    Timer.periodic(Duration(seconds: 8), (timer) {
                      getBusLocation(route);
                    });
                    log(selectedRoute.toString());
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RawChip(
                  label: SizedBox(
                      height: 50,
                      child: Column(children: [
                        Text("Bus 3"),
                        Text("Ghantaghar - basni")
                      ])),
                  onPressed: () {
                    selectedRoute = 2;
                    route = "B3";
                    routeColor = Colors.red;
                    Timer.periodic(Duration(seconds: 8), (timer) {
                      getBusLocation(route);
                    });
                    log(selectedRoute.toString());
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                RawChip(
                  label: SizedBox(
                      height: 50,
                      child: Column(
                          children: [Text("Bus 4"), Text("Mandore - CHB")])),
                  onPressed: () {
                    selectedRoute = 3;
                    route = "B4";
                    routeColor = Colors.deepPurple;
                    Timer.periodic(Duration(seconds: 8), (timer) {
                      getBusLocation(route);
                    });
                    log(selectedRoute.toString());
                    setState(() {});
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
