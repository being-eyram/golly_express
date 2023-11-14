import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/login_models.dart';
import 'package:golly_express/network/api/request_models/signup_models.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:http/http.dart' as http;

import '../response_models/login_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

class GollyApiService {
  final _client = http.Client();

  Future<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic) fromJson,
  ) async {
    final jsonBody = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return fromJson(jsonBody);
    } else {
      throw Exception(jsonBody['message']);
    }
  }

  Future<AuthResponse> loginUser({
    required LoginRequest body,
  }) async {
    final response = await _client.post(
      Endpoint.login,
      body: jsonEncode(body.toJson()),
    );

    return _handleResponse(response, (json) {
      return AuthResponse.fromJson(json);
    });
  }

  Future<AuthResponse> signupUser({
    required SignUpRequest body,
  }) async {
    final response = await _client.post(
      Endpoint.signup,
      body: jsonEncode(body.toJson()),
    );

    return _handleResponse(response, (json) {
      return AuthResponse.fromJson(json);
    });
  }
}
