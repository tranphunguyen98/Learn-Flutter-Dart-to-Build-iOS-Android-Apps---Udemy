import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavoriteValue(bool favoriteValue) {
    isFavorite = favoriteValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;

    _setFavoriteValue(!isFavorite);

    final url =
        "https://myshop-77c17.firebaseio.com/userFavorites/$userId/$id.json?auth=$token";

    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );

      if (response.statusCode >= 400) {
        print("Error!!!!");
        _setFavoriteValue(oldStatus);
      }
    } catch (error) {
      print(error);
      _setFavoriteValue(oldStatus);
    }
  }
}
