import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressLineContainer extends StatelessWidget {
  const AddressLineContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.showBorder = true,
  });

  final String title;
  final String subtitle;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 16.w),
      // margin: EdgeInsets.only(top: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: showBorder
            ? Border.all(
                width: 1.5,
                color: const Color(0xFFEDEFEE),
              )
            // : Border.all(
            //     width: 0,
            //     color: Colors.transparent,
            //   ),
            : const Border(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // address lines
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFFA3ADAA),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // const Spacer(),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.grey[400],
                  content: const Text("Copied to Clipboard"),
                  duration: const Duration(milliseconds: 200),
                ),
              );
            },
            child: Icon(
              Icons.copy,
              size: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
