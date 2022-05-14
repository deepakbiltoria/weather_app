import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    LocationPermission checkPermission = await Geolocator.requestPermission();

    LocationPermission permission = await Geolocator.checkPermission();
    try {
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print('permission denied');
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);

        this.longitude = position.longitude;
        this.latitude = position.latitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
