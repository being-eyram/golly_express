import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';

class VerifyIDCard extends StatelessWidget {
  const VerifyIDCard({
    super.key,
    this.onTap,
  });

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFFA0101),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userIDIcon,
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify your ID",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "A valid Ghana card is required to verify your account",
                    style: TextStyle(
                      color: Color(0xFFA3ADAA),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: onTap,
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
