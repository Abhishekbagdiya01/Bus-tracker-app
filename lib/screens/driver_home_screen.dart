import 'dart:async';
import 'dart:developer';
import 'package:bus_tracker/models/driver_model.dart';
import 'package:bus_tracker/repository/firestore_repository.dart';
import 'package:bus_tracker/utils/map_routes.dart';
import 'package:bus_tracker/utils/utils.dart';
import 'package:bus_tracker/widgets/custom_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverHomeScreen extends StatefulWidget {
  DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  Position? currentPosition = null;
  DriverModel? driverInfo;
  void driverDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    driverInfo = await FireStoreRepository().getDriverDetails(uid);
    log(driverInfo!.busNumber);
    setState(() {});
  }

  void getCurrentPosition() async {
    await MapPermission.checkAndRequestLocationPermission();
    while (true) {
      try {
        currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        log("Driver Location ${currentPosition}  \n Lat : ${currentPosition!.latitude} || long : ${currentPosition!.longitude}");
      } catch (error) {
        log("error : ${error}");
      }
      await Future.delayed(const Duration(seconds: 8));
    }
  }

  List routes = [route1, route2, route3, route4];
  int selectedRoute = 0;

  bool isClicked = false;
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(26.268253, 73.035416),
    zoom: 14.4746,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPosition();
    driverDetails();
  }

  // List routes = [route1, route2, route3, route4];
  @override
  Widget build(BuildContext context) {
    if (driverInfo != null) {
      if (driverInfo!.busNumber == "B1") {
        selectedRoute = 0;
      } else if (driverInfo!.busNumber == "B2") {
        selectedRoute = 1;
      } else if (driverInfo!.busNumber == "B3") {
        selectedRoute = 2;
      } else if (driverInfo!.busNumber == "B4") {
        selectedRoute = 3;
      }
    } else {
      CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: driverInfo != null
            ? Text("Greetings , ${driverInfo!.name}")
            : CircularProgressIndicator(),
      ),
      drawer: driverInfo != null
          ? CustomDrawer(
              name: driverInfo!.name,
              imageUrl: driverInfo!.imageUrl,
            )
          : SizedBox(),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                setState(() {
                  // bottomPaddingOfMap = 300.0;
                });
                getCurrentPosition();
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: routes[selectedRoute],
                  color: Colors.cyan,
                  width: 5,
                ),
              },
              markers: {
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: currentPosition != null
                      ? LatLng(
                          currentPosition!.latitude, currentPosition!.longitude)
                      : LatLng(0, 0),
                )
              },
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () async {
                if (isClicked == false) {
                  isClicked = true;
                  log("btn clicked ${isClicked}");
                  setState(() {});
                  while (isClicked) {
                    FireStoreRepository()
                        .sendLocationToFireStore(
                            busNo: driverInfo!.busNumber,
                            lat: currentPosition!.latitude.toString(),
                            lng: currentPosition!.longitude.toString())
                        .then((value) {
                      log("${currentPosition} sended to firebase");
                    });
                    await Future.delayed(const Duration(seconds: 20));
                  }
                } else {
                  isClicked = false;
                  FireStoreRepository()
                      .sendLocationToFireStore(
                          busNo: driverInfo!.busNumber, lat: "0", lng: "0")
                      .then((value) {
                    log("${currentPosition} sended to firebase");
                  });
                  log("Location sharing stop \n btn clicked ${isClicked}");
                  setState(() {});
                }
              },
              child: isClicked ? Text("Stop") : Text("Share location"))
        ],
      ),
    );
  }
}
