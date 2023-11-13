import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/response_models/signup_response.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:http/http.dart' as http;

import '../response_models/login_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

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
    debugPrint('response : ${response.body}');
    debugPrint('email : $email');
    debugPrint('password : $password');
    return LoginResponse.fromJson(jsonBody);
  }

  Future<SignupResponse> signupUser({
    required String email,
    required String password,
    required String phoneNumber,
    required String fullName,
  }) async {
    final response = await _client.post(
      Endpoint.signup,
      body: jsonEncode({
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'fullname': fullName,
      }),
    );

    final jsonBody = jsonDecode(response.body);
    debugPrint('response : ${response.body}');
    debugPrint('email : $email');
    debugPrint('password : $password');
    debugPrint('full name:  $fullName');
    debugPrint('phone number:  $phoneNumber');

    return SignupResponse.fromJson(jsonBody);
  }
}
