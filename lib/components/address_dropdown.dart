import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/address_line_container.dart';

class AddressDropdown extends StatelessWidget {
  const AddressDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 1.6,
          color: const Color(0xFFEDEFEE),
        ),
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(16.h).copyWith(top: 0),
        shape: Border.all(color: Colors.transparent),
        leading: SizedBox(
          child: gollyExpressLogoMini,
        ),
        tilePadding: EdgeInsets.symmetric(horizontal: 16.h),
        title: const Text(
          "Your Golly Express Address",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        children: [
          const Divider(
            height: 1,
            thickness: 1.5,
            color: Color(0xFFF6F7F6),
          ),
          SizedBox(height: 12.h),
          const AddressLineContainer(
            showBorder: false,
            title: "Address Line 1",
            subtitle: "2507 Investors Row, STE 100 Unit D5",
          ),
          SizedBox(height: 16.h),
          const AddressLineContainer(
            showBorder: false,
            title: "Address Line 2",
            subtitle: "1904",
          ),
          SizedBox(height: 16.h),
          const AddressLineContainer(
            showBorder: false,
            title: "City",
            subtitle: "Orlando",
          ),
          SizedBox(height: 16.h),
          const AddressLineContainer(
            showBorder: false,
            title: "Zip Code",
            subtitle: "32837",
          ),
          SizedBox(height: 16.h),
          const AddressLineContainer(
            showBorder: false,
            title: "Phone",
            subtitle: "+1(689) 209-8652",
          ),
        ],
      ),
    );
  }
}
