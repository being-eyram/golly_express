import 'package:go_router/go_router.dart';
import 'package:golly_express/screens/signin.dart';
import 'package:golly_express/screens/onboarding.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';

import '../home.dart';
import '../signup.dart';

final GoRouter appRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
    // redirect: (context, state) async {
    //   var didOnboard = await getUserOnboardStatus() ?? false;
    //   return didOnboard ? '/signin' : null;
    // },
  ),
  GoRoute(
    path: '/signin',
    builder: (context, state) => const SigninScreen(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignUpScreen(),
  ),
]);
