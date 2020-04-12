import 'package:clima/location.dart';
import 'networking.dart';

const String apiKey = '5b84b3ed7e662d1abc027024534203d2';
const String weatherURl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    final location = Location();

    await location.getCurrentLocation();

    final networkHeper = NetworkHelper(
        '$weatherURl?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');

    return await networkHeper.getData();
  }

  Future<dynamic> getCityWeatherData(String cityName) async {
    String url = '$weatherURl?q=$cityName&appid=$apiKey&units=metric';
    print('name $cityName');
    print('url $url');
    // String url =
    //     'https://api.openweathermap.org/data/2.5/weather?q=london&appid=5b84b3ed7e662d1abc027024534203d2';

    final networkHepler = NetworkHelper(url);

    return await networkHepler.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
