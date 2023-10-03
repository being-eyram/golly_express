import 'package:flutter/material.dart';
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
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          // ...
          // height: 86,
          // width: 167,
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: const Color(0xFFFFFBEE),
            // color: Colors.green,
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
              const SizedBox(height: 8),
              Text(
                cardTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
