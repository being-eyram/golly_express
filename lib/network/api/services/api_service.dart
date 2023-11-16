import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/extensions/http_response_extension.dart';
import 'package:golly_express/network/api/request_models/login_request_models.dart';
import 'package:golly_express/network/api/request_models/signup_request_models.dart';
import 'package:golly_express/network/api/response_models/package_categories_model.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:http/http.dart' as http;

import '../response_models/auth_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

class GollyApiService {
  final _client = http.Client();

  void closeClient() => _client.close();

  Future<AuthResponse> loginUser({
    required LoginRequest body,
  }) async {
    return await _client
        .post(Endpoints.login, body: jsonEncode(body.toJson()))
        .then(_decodeResponse)
        .then((json) => AuthResponse.fromJson(json))
        .catchError(_onError);
  }

  Future<AuthResponse> signupUser({
    required SignUpRequest body,
  }) async {
    return await _client
        .post(
          Endpoints.signup,
          body: jsonEncode(body.toJson()),
        )
        .then(_decodeResponse)
        .then((json) => AuthResponse.fromJson(json))
        .catchError(_onError);
  }

  Future fetchPackageCategories() async {
    return await _client
        .get(
          Endpoints.categories,
        )
        .then(_decodeResponse)
        .then((json) => AuthResponse.fromJson(json))
        .catchError(_onError);
  }

  Future<PackageCategories> getPackageCategories() async {
    try {
      final response = await _client.get(Endpoints.categories);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the response using the PackageCategories model
        final Map<String, dynamic> data = json.decode(response.body);
        PackageCategories apiResponse = PackageCategories.fromJson(data);
        print(apiResponse);
        return apiResponse;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception with the error message.
        throw Exception('Failed to load package categories');
      }
    } catch (e) {
      // Handle potential exceptions such as network errors.
      throw Exception('Error: $e');
    }
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
