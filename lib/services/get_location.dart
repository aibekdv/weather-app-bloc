import 'package:geolocator/geolocator.dart';

class GetLocation {
  // Fetch data with location
  String path = "";

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // return if service is not enabled
    if (!isServiceEnabled) {
      Future.error("Location not enabled");
    }

    locationPermission = await Geolocator.requestPermission();

    // status of permisson
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        return null;
      }
      return null;
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    ).then(
      (value) => {
        path = "${value.latitude}, ${value.longitude}",
      },
    );
  }

  String getPath() {
    return path;
  }
}
