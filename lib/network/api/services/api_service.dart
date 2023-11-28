import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/extensions/http_response_extension.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/network/api/request_models/otp_request.dart';
import 'package:golly_express/network/api/response_models/forgot_password_model.dart';
import 'package:golly_express/network/api/response_models/otp_response.dart';
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

// Forgot password request
  Future<String> forgotPassword({required String email}) async {
    try {
      final response = await _client.post(
        Endpoints.forgotPassword(
          queryParam: {"userEmail": email},
        ),
      );
      if (response.statusCode == 200) {
        final forgotPasswordResponse =
            forgotPasswordModelFromJson(response.body);
        final resetToken = forgotPasswordResponse.data.resetToken;
        // print(resetToken);
        return resetToken;
      } else {
        throw Exception(
            'Failed to reset password. Status code: {$response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

// Verify OTP request
  Future<OtpResponse> verifyOtp({required OtpRequest requestBody}) async {
    try {
      final response = await _client.post(
        Endpoints.verifyOtp,
        body: requestBody.otp,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${requestBody.resetToken}',
        },
      );
      if (response.statusCode == 200) {
        final otpResponse = otpResponseFromJson(response.body);
        print("request status: ${otpResponse.message}");

        return otpResponse;
      } else {
        throw Exception(
            'Failed to verify OTP. Status code: {$response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

// get user info request
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
        throw Exception(
            'Failed to load user info. Status Code: {$response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

  // get package categories request
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
        final data = json.decode(response.body);
        final packageCategories = PackageCategories.fromJson(data).data;
        return packageCategories;
      } else {
        throw Exception('Failed to load package categories');
      }
    } catch (e) {
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
