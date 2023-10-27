import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/api/request_models/login_models.dart';
import 'package:golly_express/api/request_models/signup_models.dart';

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

  Future<void> login({required LoginRequestModel req}) async {}

  Future<void> resetPassword({required LoginRequestModel req}) async {}

  Future<void> forgotPassword({required LoginRequestModel req}) async {}

  Future<void> logout({required SignUpRequestModel req}) async {}
}
