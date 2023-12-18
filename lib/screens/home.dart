import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/cards/icon_with_text_card.dart';
import 'package:golly_express/cards/track_package_card.dart';
import 'package:golly_express/cards/verify_id_card.dart';
import 'package:golly_express/components/address_dropdown.dart';
import 'package:golly_express/components/package_tracking_history.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/package.dart';
import 'package:golly_express/providers/user_info_provider.dart';
import 'package:golly_express/shared/extensions/string_extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  final _userIsVerified = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoProvider);

    return Scaffold(
      // bottomNavigationBar: const MainContainer(),
      body: SafeArea(
        child: SingleChildScrollView(
          // reverse: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.h,
              horizontal: 16.w,
            ),
            child: userInfo.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) =>
                  const Text('Oops, something unexpected happened'),
              data: (user) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // greeting(user.fullName),
                    user.fullName.greet(),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // display your golly express dropdown if verified else verify id card
                  _userIsVerified
                      // ? const SizedBox(height: 50)
                      ? const AddressDropdown()
                      : VerifyIDCard(
                          onTap: () => context.push("/verifyID"),
                        ),

                  SizedBox(height: 16.h),
                  const TrackPackageCard(),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconWithTextCard(
                        cardTitle: "Calculate Estimate",
                        cardColor: const Color(0xFFFFFBEE),
                        cardIcon: calculatorIcon,
                        iconContainerColor: const Color(0xFFFFC727),
                        onTap: () => context.push("/calculateEstimate"),
                      ),
                      SizedBox(width: 10.w),
                      IconWithTextCard(
                        cardTitle: "Create Shipment",
                        cardColor: const Color(0xFFFFE6E2),
                        cardIcon: cargoShipIcon,
                        iconContainerColor: const Color(0xFFB35042),
                        onTap: () => context.push("/createShipment"),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  recentPackages.isEmpty
                      ? const EmptyTrackingHistory()
                      : const PackageTrackingHistory()
                  // const EmptyTrackingHistory(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
