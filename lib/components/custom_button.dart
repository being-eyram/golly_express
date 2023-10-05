import 'package:flutter/material.dart';

class CustomDisabledButton extends StatelessWidget {
  const CustomDisabledButton({
    super.key,
    required this.buttonText,
    this.isEnabled = false,
  });
  final bool isEnabled;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 14,
        bottom: 24.0,
      ),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor:
              isEnabled ? const Color(0xFF557A46) : const Color(0xFFE8E9E8),
          minimumSize: const Size(double.infinity, 54),
          maximumSize: const Size(double.infinity, 54),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 15,
              color: isEnabled ? Colors.white : const Color(0xFFA3ADAA),
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
