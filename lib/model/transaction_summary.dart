import 'package:flutter/material.dart';

class TransactionSummary extends StatelessWidget {
  const TransactionSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              // width: 103.67,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xFFEDEFEE),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "32",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "To Receive",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              // width: 103.67,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xFFEDEFEE),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "32",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Total Orders",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              // width: 103.67,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xFFEDEFEE),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Text(
                    "32",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Received",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
