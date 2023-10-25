import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.isEnabled = false,
    required this.onPressed,
    this.borderRadius = 16,
  });
  final bool isEnabled;
  final String buttonText;
  final double borderRadius;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor:
            isEnabled ? const Color(0xFF557A46) : const Color(0xFFE8E9E8),
        minimumSize: const Size(double.infinity, 54),
        maximumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 14,
            color: isEnabled ? Colors.white : const Color(0xFFA3ADAA),
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
