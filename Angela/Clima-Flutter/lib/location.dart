import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longtitude;

  Location({this.latitude, this.longtitude});

  Future<void> getCurrentLocation() async {
    print('wait...');

    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.latitude = position.latitude;
      this.longtitude = position.longitude;
    } catch (exception) {
      print('err: $exception');
      this.latitude = 0.0;
      this.longtitude = 0.0;
    }

    // print('$latitude : $longtitude');
  }
}
