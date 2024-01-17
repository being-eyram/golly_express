import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconWithTextCard extends StatelessWidget {
  const IconWithTextCard({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    required this.cardColor,
    required this.iconContainerColor,
    required this.onTap,
  });
  final String cardTitle;
  final SvgPicture cardIcon;
  final Color cardColor;
  final Color iconContainerColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Color(0xFFFFC727),
                  color: iconContainerColor,
                ),
                child: cardIcon,
              ),
              SizedBox(height: 8.h),
              Text(
                cardTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
