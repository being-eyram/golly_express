import 'package:go_router/go_router.dart';
import 'package:golly_express/screens/golly_express_address_screen.dart';
import 'package:golly_express/screens/home.dart';
import 'package:golly_express/screens/home_verify_id.dart';
import 'package:golly_express/screens/my_address_screen.dart';
import 'package:golly_express/screens/packages_screen.dart';
import 'package:golly_express/screens/profile_screen.dart';
import 'package:golly_express/screens/signin.dart';

import '../signup.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/home",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const ProfileScreen(),
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
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/packages',
      builder: (context, state) => const PackageScreen(),
    ),
    GoRoute(
      path: '/gollyExpressAddress',
      builder: (context, state) => const GollyExpressAddressScreen(),
    ),
    GoRoute(
      path: '/myAddress',
      builder: (context, state) => const MyAddressScreen(),
    ),

    // home
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/verifyIDHome',
      builder: (context, state) => const VerifyIDHomeScreen(),
    ),
  ],
);
