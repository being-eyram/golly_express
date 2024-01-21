import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/network/api/request_models/otp_request.dart';
import 'package:golly_express/network/api/response_models/forgot_password_model.dart';
import 'package:golly_express/network/api/response_models/otp_response.dart';
import 'package:golly_express/network/api/response_models/package_categories_model.dart';
import 'package:golly_express/network/api/response_models/reset_password_response.dart';
import 'package:golly_express/network/api/response_models/user_model.dart';
import 'package:golly_express/network/endpoint.dart';
import 'package:golly_express/shared/extensions/http_response_extension.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';
import 'package:http/http.dart' as http;

import '../request_models/reset_password_request.dart';
import '../response_models/auth_response.dart';

final apiServiceProvider = Provider((ref) => GollyApiService());

class GollyApiService {
  final _client = http.Client();

  void closeClient() => _client.close();

// LOGIN REQUEST FUNCTION
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

// REGISTER/SIGN UP REQUEST FUNCTION
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

// FORGOT PASSWORD REQUEST FUNCTION
  Future<ForgotPasswordModel> forgotPassword({required String email}) async {
    try {
      final response = await _client.post(
        Endpoints.forgotPassword(
          queryParam: {"userEmail": email},
        ),
      );
      if (response.statusCode == 200) {
        final forgotPasswordResponse =
            forgotPasswordModelFromJson(response.body);
        return forgotPasswordResponse;
      } else {
        throw Exception(
            'Failed to reset password. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

// VERIFY OTP REQUEST FUNCTION
  Future<OtpResponse> verifyOtp({required OtpRequest requestBody}) async {
    try {
      final response = await _client.post(
        Endpoints.verifyOtp,
        body: jsonEncode(requestBody.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${requestBody.resetToken}',
        },
      );
      if (response.statusCode == 200) {
        final otpResponse = otpResponseFromJson(response.body);
        return otpResponse;
      } else {
        throw Exception(
            'Failed to verify OTP. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

// RESET PASSWORD REQUEST
  Future<ResetPasswordResponse> resetPassword({
    required ResetPasswordRequest requestBody,
  }) async {
    try {
      final response = await _client.post(
        Endpoints.resetPassword,
        body: jsonEncode(requestBody.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${requestBody.resetToken}',
        },
      );
      if (response.statusCode == 200) {
        final resetResponse = resetPasswordResponseFromJson(response.body);
        return resetResponse;
      } else {
        throw Exception(
            'Failed to reset password. Status code: {$response.statusCode}');
      }
    } catch (e) {
      throw ('Exception: $e');
    }
  }

// GET USER DATA REQUEST FUNCTION
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

  // GET PACKAGE CATEGORIES REQUEST FUNCTION
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

  // DECODE RESPONSE FUNCTION
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
          debugPrint(json);
          debugPrint('-------------');
          packageCategories = PackageCategories.fromJson(json).data;
          for (int i = 0; i < packageCategories.length; i++) {
            debugPrint(packageCategories[i].name);
          }
          return PackageCategories.fromJson(json);
        })
        .catchError(_onError);
  }
}
