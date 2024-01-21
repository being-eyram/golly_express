import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinputTheme {
  static PinTheme get defaultPinTheme {
    return PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x1F000000)),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static PinTheme get focusedPinTheme {
    return defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFF557A46)),
      borderRadius: BorderRadius.circular(8),
    );
  }

  static PinTheme get submittedPinTheme {
    return defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  }
}
