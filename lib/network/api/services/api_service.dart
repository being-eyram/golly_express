import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:http/http.dart' as http;

import '../response_models/login_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

// todo : make this a singleton since we want only one instance of this throughout the app.
class GollyApiService {
  final _client = http.Client();

  Future<LoginResponse> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      Endpoint.login,
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final jsonBody = jsonDecode(response.body);
    return LoginResponse.fromJson(jsonBody);
  }
}
