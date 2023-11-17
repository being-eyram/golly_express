import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>(
  (_) => "Ben-Aaron Mills-Pappoe",
);
//
// final phoneNumberProvider = StateProvider<String>(
//   (_) => "571592866",
// );
//
// final emailProvider = StateProvider<String>(
//   (_) => "benaaron866@gmail.com",
// );

final emailProvider = StateProvider<String>(
  (_) => "",
);

final fullNameProvider = StateProvider<String>(
  (_) => "",
);

final phoneNumberProvider = StateProvider<String>(
  (_) => "",
);

final bearerTokenProvider = StateProvider<String?>(
  (_) => "",
);
