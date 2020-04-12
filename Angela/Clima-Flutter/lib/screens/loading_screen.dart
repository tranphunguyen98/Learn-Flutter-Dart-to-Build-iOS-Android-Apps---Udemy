import 'package:clima/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    final location = Location();
    await location.getCurrentLocation();
    print(location.longtitude);
  }

  void getWeather() async {
    final response = await http.get(
        'https://samples.openweathermap.org/data/2.5/find?lat=55.5&lon=37.5&cnt=10&appid=439d4b804bc8187953eb36d2a8c26a02');
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    print('a');
    getLocation();
    print('b');

    getWeather();
    print('c');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
