import 'package:go_router/go_router.dart';
import 'package:golly_express/components/main_container.dart';
import 'package:golly_express/screens/another_onboarding_screen.dart';
import 'package:golly_express/screens/calculate_estimate_screen.dart';
import 'package:golly_express/screens/create_shipment_screen.dart';
import 'package:golly_express/screens/current_shipment_screen.dart';
import 'package:golly_express/screens/edit_profile_screen.dart';
import 'package:golly_express/screens/home.dart';
import 'package:golly_express/screens/onboarding/add_address.dart';
import 'package:golly_express/screens/onboarding/forgot_password_screen.dart';
import 'package:golly_express/screens/onboarding/get_started_screen.dart';
import 'package:golly_express/screens/onboarding/login_screen.dart';
import 'package:golly_express/screens/onboarding/onboarding_screen.dart';
import 'package:golly_express/screens/onboarding/otp_screen.dart';
import 'package:golly_express/screens/onboarding/register_password_screen.dart';
import 'package:golly_express/screens/onboarding/register_screen.dart';
import 'package:golly_express/screens/onboarding/signin_option.dart';
import 'package:golly_express/screens/packages_screen.dart';
import 'package:golly_express/screens/profile%20screen/change_password_screen.dart';
import 'package:golly_express/screens/profile%20screen/golly_express_address_screen.dart';
import 'package:golly_express/screens/profile%20screen/id%20verification/check_your_photo.dart';
import 'package:golly_express/screens/profile%20screen/id%20verification/id_back.dart';
import 'package:golly_express/screens/profile%20screen/id%20verification/id_front.dart';
import 'package:golly_express/screens/profile%20screen/id%20verification/id_verification_screen.dart';
import 'package:golly_express/screens/profile%20screen/id%20verification/verified_successfully_screen.dart';
import 'package:golly_express/screens/profile%20screen/my_address_screen.dart';
import 'package:golly_express/screens/profile%20screen/notifications_screen.dart';
import 'package:golly_express/screens/profile%20screen/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/onboard",
  // initialLocation: "/mainContainer",
  // initialLocation: "/onboarding",
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const ProfileScreen(),
      // redirect: (context, state) async {
      //   var didOnboard = await getUserOnboardStatus() ?? false;
      //   return didOnboard ? '/signin' : null;
      // },
    ),

    // Onboarding Routes
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const AnotherOnboardingScreen(),
    ),

    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: '/getStarted',
      builder: (context, state) => const GetStartedScreen(),
    ),

    GoRoute(
      path: '/signinOption',
      builder: (context, state) => const SigninOptionScreen(),
    ),

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: '/forgotPassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    GoRoute(
      path: '/otpScreen',
      builder: (context, state) => const OtpScreen(),
    ),

    GoRoute(
      path: '/registerPassword',
      builder: (context, state) => const RegisterPasswordScreen(),
    ),

    GoRoute(
      path: '/addAddress',
      builder: (context, state) => const AddAddressScreen(),
    ),

    // nav bar routes
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/calculateEstimate',
      builder: (context, state) => const CalculateEstimateScreen(),
    ),

    GoRoute(
      path: '/createShipment',
      builder: (context, state) => const CreateShipmentScreen(),
    ),

    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),

    GoRoute(
      path: '/editProfile',
      builder: (context, state) => const EditProfileScreen(),
    ),

    GoRoute(
      path: '/changePassword',
      builder: (context, state) => const ChangePasswordScreen(),
    ),

    GoRoute(
      path: '/packages',
      builder: (context, state) => const PackageScreen(),
    ),

    GoRoute(
      path: '/currentShipment',
      builder: (context, state) => const CurrentShipmentScreen(),
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
      path: '/verifyID',
      builder: (context, state) => const IDVerificationScreen(),
    ),

    GoRoute(
      path: '/frontID',
      builder: (context, state) => const FrontIDScreen(),
    ),

    GoRoute(
      path: '/backID',
      builder: (context, state) => const BackIDScreen(),
    ),

    GoRoute(
      path: '/checkPhoto/:image',
      builder: (context, state) => const CheckPhotoScreen(),
    ),

    GoRoute(
      path: '/verifiedSuccess',
      builder: (context, state) => const VerifiedSuccessfully(),
    ),
  ],
);
