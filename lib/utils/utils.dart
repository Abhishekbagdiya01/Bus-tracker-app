import 'package:geolocator/geolocator.dart';

class MapPermission {
  static Future<LocationPermission> checkAndRequestLocationPermission() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();
      return locationPermission;
    }
    return locationPermission;
  }
}
