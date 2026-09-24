import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/food_model.dart';

class FoodApi {
  final String baseUrl = 'http://localhost:3000';

  Future<List<FoodItem>> getFoodList() async {
    final uri = Uri.parse('$baseUrl/foods');

    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data
          .map(
            (item) => FoodItem.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw Exception(
      'Imeshindikana kupata orodha ya vyakula. '
      'Status: ${response.statusCode}',
    );
  }
}