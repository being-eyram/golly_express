import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/services/api_service.dart';

final forgotPasswordProvider =
    FutureProvider.family.autoDispose((ref, String email) async {
  final forgotPassword =
      ref.watch(apiServiceProvider).forgotPassword(email: email);
  ref.read(resetTokenProvider.notifier).state = await forgotPassword;
  return forgotPassword;
});

final resetPasswordEmail = StateProvider((_) => "");

final resetTokenProvider = StateProvider((_) => "");

final isLoadingProvider = StateProvider<bool>((_) => false);
