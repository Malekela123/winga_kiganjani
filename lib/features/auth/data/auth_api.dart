
import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl = 'http://localhost:3000';

  Future<Map<String, dynamic>> register({
    required String fullName,
    required String phone,
    String? email,
    required String password,
    required String role,
  }) async {
    final uri = Uri.parse('$baseUrl/users/register');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'fullName': fullName,
        'phone': phone,
        'email': email,
        'password': password,
        'role': role,
      }),
    );

    final data = _decodeResponse(response);

    if (response.statusCode == 201) {
      return data;
    }

    throw Exception(
      data['message']?.toString() ??
          'Imeshindikana kusajili akaunti.',
    );
  }

  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    final uri = Uri.parse('$baseUrl/users/login');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phone': phone,
        'password': password,
      }),
    );

    final data = _decodeResponse(response);

    if (response.statusCode == 200 ||
    response.statusCode == 201) {
  return data;
}
    throw Exception(
      data['message']?.toString() ??
          'Imeshindikana kuingia kwenye akaunti.',
    );
  }

  Map<String, dynamic> _decodeResponse(
    http.Response response,
  ) {
    if (response.body.isEmpty) {
      return {};
    }

    try {
      final decoded = jsonDecode(response.body);

      if (decoded is Map<String, dynamic>) {
        return decoded;
      }

      return {
        'data': decoded,
      };
    } catch (_) {
      return {
        'message': response.body,
      };
    }
  }
}

