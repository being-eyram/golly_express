import 'package:go_router/go_router.dart';
import 'package:golly_express/components/main_container.dart';
import 'package:golly_express/main.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
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
import 'package:golly_express/screens/onboarding/login_screenn.dart';
import 'package:golly_express/screens/onboarding/onboarding_screen.dart';
import 'package:golly_express/screens/onboarding/otp_screen.dart';
import 'package:golly_express/screens/onboarding/register_password_screen.dart';
import 'package:golly_express/screens/onboarding/register_screen.dart';
import 'package:golly_express/screens/onboarding/reset_password_screen.dart';
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
import 'package:golly_express/shared/app_routes.dart';

// final userToken = getUserBearerToken();

final GoRouter appRouter = GoRouter(
  initialLocation: isOnboarded == null
      ? AppRoutes.onboard
      : isLoggedIn == null
          ? AppRoutes.login
          : AppRoutes.mainContainer,
  // initialLocation: "/mainContainer",
  // initialLocation: "/onboarding",
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.base,
      builder: (context, state) => const LoginScreen(),
      // redirect: (context, state) async {
      //   var didOnboard = await getUserOnboardStatus() ?? false;
      //   return didOnboard ? '/signin' : null;
      // },
    ),

    // ONBOARDING ROUTES
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const AnotherOnboardingScreen(),
    ),

    GoRoute(
      path: AppRoutes.onboard,
      builder: (context, state) => const OnboardingScreen(),
    ),

    GoRoute(
      path: AppRoutes.getStarted,
      builder: (context, state) => const GetStartedScreen(),
    ),

    GoRoute(
      path: AppRoutes.signinOption,
      builder: (context, state) => const SigninOptionScreen(),
    ),

    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: "/loginn",
      builder: (context, state) => const LoginScreenn(),
    ),

    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: AppRoutes.registerPassword,
      builder: (context, state) {
        // String args = state.extra as String;
        // AuthRequest args = state.extra as AuthRequest;
        return RegisterPasswordScreen(userCred: state.extra as AuthRequest);
      },
    ),

    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),

    GoRoute(
      path: AppRoutes.otpScreen,
      builder: (context, state) => OtpScreen(
        resetToken: state.extra.toString(),
      ),
    ),

    GoRoute(
      path: AppRoutes.resetPassword,
      builder: (context, state) => ResetPasswordScreen(
        resetToken: state.extra.toString(),
      ),
    ),

    GoRoute(
      path: AppRoutes.addAddress,
      builder: (context, state) => const AddAddressScreen(),
    ),

    // BOTTOM NAV NAR ROUTES
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: AppRoutes.mainContainer,
      builder: (context, state) => const MainContainer(),
    ),

    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => const ProfileScreen(),
    ),

    GoRoute(
      path: AppRoutes.packages,
      builder: (context, state) => const PackageScreen(),
    ),

    GoRoute(
      path: AppRoutes.notifications,
      builder: (context, state) => const NotificationsScreen(),
    ),

    // PLUS BOTTOM SHEET ROUTES
    GoRoute(
      path: AppRoutes.calculateEstimate,
      builder: (context, state) => const CalculateEstimateScreen(),
    ),

    GoRoute(
      path: AppRoutes.createShipment,
      builder: (context, state) => const CreateShipmentScreen(),
    ),

    // PROFILE SCREEN ROUTES
    GoRoute(
      path: AppRoutes.editProfile,
      builder: (context, state) => const EditProfileScreen(),
    ),

    GoRoute(
      path: AppRoutes.changePassword,
      builder: (context, state) => const ChangePasswordScreen(),
    ),

    GoRoute(
      path: AppRoutes.currentShipment,
      builder: (context, state) => const CurrentShipmentScreen(),
    ),

    GoRoute(
      path: AppRoutes.gollyExpressAddress,
      builder: (context, state) => const GollyExpressAddressScreen(),
    ),
    GoRoute(
      path: AppRoutes.myAddress,
      builder: (context, state) => const MyAddressScreen(),
    ),

    // ID VERIFICATION ROUTES
    GoRoute(
      path: AppRoutes.verifyID,
      builder: (context, state) => const IDVerificationScreen(),
    ),

    GoRoute(
      path: AppRoutes.frontID,
      builder: (context, state) => const FrontIDScreen(),
    ),

    GoRoute(
      path: AppRoutes.backID,
      builder: (context, state) => const BackIDScreen(),
    ),

    GoRoute(
      path: '/checkPhoto/:image',
      builder: (context, state) => const CheckPhotoScreen(),
    ),

    GoRoute(
      path: AppRoutes.verifiedSuccess,
      builder: (context, state) => const VerifiedSuccessfully(),
    ),
  ],
);
