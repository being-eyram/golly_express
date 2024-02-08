import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/api/request_models/login_models.dart';
import 'package:golly_express/api/request_models/signup_models.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String message;

  AuthenticationErrorState({required this.message});
}

class AuthenticationService extends StateNotifier<AuthenticationState> {
  AuthenticationService() : super(AuthenticationInitialState());

  Future<void> signup({required SignUpRequestModel req}) async {}

  // Future<void> login({required LoginRequestModel req}) async {}
  Future<LoginResponseModel> login(LoginRequestModel req) async {
    String url = "https://reqres.in/api/login";

    final response = await http.post(
      Uri.parse(url),
      body: req,
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<void> resetPassword({required LoginRequestModel req}) async {}

  Future<void> forgotPassword({required LoginRequestModel req}) async {}

  Future<void> logout({required SignUpRequestModel req}) async {}
}

final authenticationServiceProvider = Provider<AuthenticationService>(
  (_) => AuthenticationService(),
);


// void login(String email , password) async {
  
//   try{
    
//     Response response = await post(
//       Uri.parse('https://reqres.in/api/login'),
//       body: {
//         'email' : email,
//         'password' : password
//       }
//     );

//     if(response.statusCode == 200){
      
//       var data = jsonDecode(response.body.toString());
//       print(data['token']);
//       print('Login successfully');

//     }else {
//       print('failed');
//     }
//   }catch(e){
//     print(e.toString());
//   }
// }