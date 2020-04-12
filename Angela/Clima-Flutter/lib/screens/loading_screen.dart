import 'package:clima/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '5b84b3ed7e662d1abc027024534203d2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;

  Future<void> getLocation() async {
    location = Location();
    await location.getCurrentLocation();
    print(location.longtitude);
  }

  void getWeather() async {
    await getLocation();
    final networkHeper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longtitude}&appid=5b84b3ed7e662d1abc027024534203d2');
    final data = await networkHeper.getData();
    print(data['coord']['lon']);
    Navigator.pushNamed(context, LocationScreen.routeNamed);
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
