import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final gollyExpressLogo = Image.asset(
  'assets/images/golly_express.jpeg',
  width: 98.w,
  height: 91.h,
);

final gollyExpressLogoMini = Image.asset(
  'assets/images/golly_express.jpeg',
  width: 30,
  height: 30,
);

final userProfile = SvgPicture.asset(
  'assets/images/ic_user_profile.svg',
  semanticsLabel: 'User Profile',
);

// Bottom Navigation Bar Icons
final navHome =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_home_outlined.svg");

final navHomeActive =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_home_filled.svg");

final navPackages =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_package_outlined.svg");

final navPackagesActive =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_package_filled.svg");

final navProfile =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_account_outlined.svg");

final navProfileActive =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_account_filled.svg");

final navNotifications = SvgPicture.asset(
    "assets/images/nav_bar_icons/ic_notifications_outlined.svg");

final navNotificationsActive =
    SvgPicture.asset("assets/images/nav_bar_icons/ic_notifications_filled.svg");

//  Sign Up Logos
final googleLogo = SvgPicture.asset(
  'assets/images/ic_google.svg',
  semanticsLabel: 'Google Logo',
);

final appleLogo = SvgPicture.asset(
  'assets/images/ic_apple.svg',
  semanticsLabel: 'Apple Logo',
);

// Onbaording Images
final onboardingImage1 = Image.asset(
  "assets/images/onboarding/onboarding_image1.png",
);

final onboardingImage2 = Image.asset(
  "assets/images/onboarding/onboarding_image2.png",
);

final onboardingImage3 = Image.asset(
  "assets/images/onboarding/onboarding_image3.png",
);

// Menu Tab Icons
final calculatorIcon = SvgPicture.asset(
  'assets/images/ic_calculator.svg',
  semanticsLabel: 'Calculator',
);

final greenCalculatorIcon = SvgPicture.asset(
  'assets/images/ic_calculator.svg',
  colorFilter: const ColorFilter.mode(
    Color(0xFF557A46),
    BlendMode.srcIn,
  ),
  semanticsLabel: 'Calculator',
);

final cargoShipIcon = SvgPicture.asset(
  'assets/images/ic_cargo_ship.svg',
  semanticsLabel: 'Cargo Ship',
);

final cargoShipIcon2 = SvgPicture.asset(
  'assets/images/ic_cargo_ship.svg',
  semanticsLabel: 'Cargo Ship',
);

final greenCargoShipIcon = SvgPicture.asset(
  'assets/images/ic_cargo_ship.svg',
  // color: const Color(0xFF557A46),
  colorFilter: const ColorFilter.mode(
    Color(0xFF557A46),
    BlendMode.srcIn,
  ),
  semanticsLabel: 'Cargo Ship',
);

// Package Icons
final genericPackageIcon = SvgPicture.asset(
  'assets/images/ic_generic_package.svg',
  semanticsLabel: 'Generic Package',
);

final trackingHistoryPackageIcon = Image.asset(
  'assets/images/vec_package2.png',
  // height: 500,
  // width: 500,
);

final packageVector = Image.asset(
  'assets/images/vec_package1.png',
  height: 200,
  width: 200,
);

final userIDIcon = Image.asset(
  "assets/images/user_id.png",
  width: 45,
  height: 45,
);

final userIDCard = SvgPicture.asset(
  "assets/images/ic_user_id.svg",
);

final frontID = SvgPicture.asset(
  "assets/images/id_front.svg",
);

final backID = SvgPicture.asset(
  "assets/images/id_back.svg",
);

final sampleIDFront = Image.asset(
  "assets/images/ghana_card_front.png",
);

final sampleIDBack = Image.asset(
  "assets/images/ghana_card_back.png",
);

final verifiedAccount = Image.asset(
  "assets/images/vec_verified.png",
);

final productCategories = [
  "Smartphone",
  "Laptop",
  "Game Console",
  "Smartwatch",
  "General Package",
  "Monitor",
  "Keyboard"
];

final smartphoneTypes = [
  "Iphone 11",
  "Iphone 11 Pro",
  "Iphone 11 Pro Max",
  "Iphone 12",
  "Iphone 12 Pro",
  "Iphone 12 Pro Max",
  "Samsung Galaxy S22 +5G",
  "Samsung Galaxy S22 Ultra +5G",
  "Samsung Galaxy S23 +5G",
  "Samsung Galaxy S23 Ultra +5G",
  "Samsung Galaxy Z Flip 3"
];

var sampleNotificationTitle = "Title Goes Here";
var sampleNotificationSubtitle =
    "Lorem ipsum dolor sit amet consectetur. Eget justo morbi vitae diam. Aliquet arcu mattis pellentesque tellus turpis adipiscing non ...";
