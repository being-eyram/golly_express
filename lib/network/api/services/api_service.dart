import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/extensions/http_response_extension.dart';
import 'package:golly_express/network/api/request_models/login_models.dart';
import 'package:golly_express/network/api/request_models/signup_models.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:http/http.dart' as http;

import '../response_models/login_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

class GollyApiService {
  final _client = http.Client();

  void closeClient() => _client.close();

  Future<AuthResponse> loginUser({
    required LoginRequest body,
  }) async {
    return await _client
        .post(Endpoint.login, body: jsonEncode(body.toJson()))
        .then(_decodeResponse)
        .then((json) => AuthResponse.fromJson(json))
        .catchError(_onError);
  }

  Future<AuthResponse> signupUser({
    required SignUpRequest body,
  }) async {
    return await _client
        .post(
          Endpoint.signup,
          body: jsonEncode(body.toJson()),
        )
        .then(_decodeResponse)
        .then((json) => AuthResponse.fromJson(json))
        .catchError(_onError);
  }

  Future<dynamic> _decodeResponse(
    http.Response response,
  ) async {
    final json = jsonDecode(response.body);
    if (response.didSucceed) return json;

    throw HttpException(json['message']);
  }

  _onError(Object err) {
    if (err is HttpException) throw err;
    throw Exception('Something Went Wrong');
  }
}
