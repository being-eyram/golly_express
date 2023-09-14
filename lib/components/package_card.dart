import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.packageName,
    required this.packageID,
    required this.packageIcon,
  });
  final String packageName;
  final String packageID;
  final SvgPicture packageIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFFEDEFEE),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF0F9FF),
            ),
            // borderRadius: BorderRadius.circular(50),
            child: packageIcon,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                packageName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                packageID,
                style: TextStyle(
                  color: Color(0xFFA3ADAA),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
