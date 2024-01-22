import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackingNumberSearchField extends StatelessWidget {
  const TrackingNumberSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          enabled: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            hintText: 'Tracking Number',
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 5.w),
          alignment: Alignment.center,
          height: 35.w,
          width: 35.w,
          // padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFF557A46),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.search,
              size: 28.w,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
