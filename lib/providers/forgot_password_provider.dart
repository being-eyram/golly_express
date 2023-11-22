import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/services/api_service.dart';

final forgotPasswordProvider = FutureProvider.family((ref, String email) async {
  return ref.watch(apiServiceProvider).forgotPassword(email: email);
});
