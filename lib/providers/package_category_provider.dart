import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/services/api_service.dart';

final packageCategoryProvider = FutureProvider((ref) async {
  return ref.watch(apiServiceProvider).getPackageCategories();
});
