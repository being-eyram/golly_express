import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/api/request_models/authentication_model.dart';

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
