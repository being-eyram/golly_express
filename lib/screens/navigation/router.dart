import 'package:go_router/go_router.dart';
import 'package:golly_express/components/main_container.dart';
import 'package:golly_express/screens/create_shipment_screen.dart';
import 'package:golly_express/screens/golly_express_address_screen.dart';
import 'package:golly_express/screens/home.dart';
import 'package:golly_express/screens/home_verify_id.dart';
import 'package:golly_express/screens/my_address_screen.dart';
import 'package:golly_express/screens/notifications_screen.dart';
import 'package:golly_express/screens/packages_screen.dart';
import 'package:golly_express/screens/profile_screen.dart';
import 'package:golly_express/screens/signin.dart';

import '../signup.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/mainContainer",
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

    // nav bar routes
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    // GoRoute(
    //   path: '/calculateEstimate',
    //   builder: (context, state) => const CalculateEstimateScreen(),
    // ),

    GoRoute(
      path: '/createShipment',
      builder: (context, state) => const CreateShipmentScreen(),
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
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),

    GoRoute(
      path: '/mainContainer',
      builder: (context, state) => const MainContainer(),
    ),

    GoRoute(
      path: '/gollyExpressAddress',
      builder: (context, state) => const GollyExpressAddressScreen(),
    ),
    GoRoute(
      path: '/myAddress',
      builder: (context, state) => const MyAddressScreen(),
    ),

    GoRoute(
      path: '/verifyIDHome',
      builder: (context, state) => const VerifyIDHomeScreen(),
    ),
  ],
);
