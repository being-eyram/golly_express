import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/extensions/http_response_extension.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/network/api/response_models/package_categories_model.dart';
import 'package:golly_express/network/api/response_models/user_model.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';
import 'package:http/http.dart' as http;

import '../response_models/auth_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

class GollyApiService {
  final _client = http.Client();

  void closeClient() => _client.close();

// login request function
  Future<AuthResponse> loginUser({required AuthRequest requestBody}) async {
    return await _client
        .post(
          Endpoints.login,
          body: jsonEncode(requestBody.toJson()),
        )
        .then(_decodeResponse)
        .then((json) => AuthResponse.fromJson(json))
        .catchError(_onError);
  }

// sign up request function
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

// get user info
  Future<UserInfo> getUserInfo() async {
    final token = await getUserBearerToken();

    try {
      final response = await _client.get(
        Endpoints.user,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final UserModel user = UserModel.fromJson(data);
        final userInfo = user.data;
        return userInfo;
      } else {
        throw Exception('{response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

  // get packages request
  Future<List<Category>> getPackageCategories() async {
    final token = await getUserBearerToken();
    try {
      http.Response response = await _client.get(
        Endpoints.categories,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the response using the PackageCategories model

        final data = json.decode(response.body);
        final packageCategories = packageCategoriesFromJson(data).data;
        return packageCategories;
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

  // decode response function
  Future<dynamic> _decodeResponse(http.Response response) async {
    final json = jsonDecode(response.body);
    // print(json);
    // print("your bearer token is: ${json['data']['token']}");
    if (response.didSucceed) return json;

    throw HttpException(json['message']);
  }

  _onError(Object err) {
    if (err is HttpException) throw err;
    throw Exception('Something Went Wrong');
  }

  // get package categories: kpakpa wayy
  Future<PackageCategories> fetchPackageCategories() async {
    final token = await getUserBearerToken();
    var packageCategories = <Category>[];
    return await _client
        .get(Endpoints.categories, headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        })
        .then(_decodeResponse)
        .then((json) {
          print(json);
          print('-------------');
          packageCategories = PackageCategories.fromJson(json).data;
          for (int i = 0; i < packageCategories.length; i++) {
            print(packageCategories[i].name);
          }
          return PackageCategories.fromJson(json);
        })
        .catchError(_onError);
  }
}
