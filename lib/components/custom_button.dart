import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLoading = false,
    required this.buttonText,
    this.isEnabled = false,
    required this.onPressed,
    this.borderRadius,
  });

  final bool isEnabled;
  final bool isLoading;
  final String buttonText;
  final double? borderRadius;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? () {} : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor:
            isEnabled ? const Color(0xFF557A46) : const Color(0xFFE8E9E8),
        minimumSize: Size(double.infinity, 54.h),
        maximumSize: Size(double.infinity, 54.h),
        // padding: EdgeInsets.all(16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        ),
      ),
      child: isLoading
          ? Transform.scale(
              scale: 0.8,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              buttonText,
              style: TextStyle(
                  fontSize: 13.sp,
                  color: isEnabled ? Colors.white : const Color(0xFFA3ADAA),
                  fontWeight: FontWeight.w800),
            ),
    );
  }
}
