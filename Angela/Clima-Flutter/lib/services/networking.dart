import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getData() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
