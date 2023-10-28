import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final bool isObscured;
  final bool isPasswordInput;
  final void Function()? suffixIconOnTap;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalidateMode;

  const InputTextField({
    super.key,
    this.isObscured = true,
    this.isPasswordInput = false,
    required this.hintText,
    this.labelText,
    this.suffixIconOnTap,
    this.suffixIcon,
    this.controller,
    this.initialValue,
    this.prefixText,
    this.prefixIcon,
    this.prefixStyle,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    final showPasswordSvg = SvgPicture.asset(
      'assets/images/ic_show_password.svg',
      semanticsLabel: 'Show Password',
      height: 18,
      width: 18,
      fit: BoxFit.scaleDown,
    );
    final hidePasswordSvg = SvgPicture.asset(
      'assets/images/ic_hide_password.svg',
      semanticsLabel: 'Hide Password',
      height: 18,
      width: 18,
      fit: BoxFit.scaleDown,
    );

    // TODO: add show divider option
    return TextFormField(
      validator: validator,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      controller: controller,
      style: const TextStyle(fontSize: 16),
      obscureText: isPasswordInput ? isObscured : false,
      decoration: InputDecoration(
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        prefixIcon: prefixIcon,
        suffixIcon: isPasswordInput
            ? InkWell(
                onTap: suffixIconOnTap,
                child: AnimatedContainer(
                  curve: Curves.easeOutSine,
                  duration: const Duration(milliseconds: 200),
                  child: isObscured ? showPasswordSvg : hidePasswordSvg,
                ),
              )
            : suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1.5,
          ),
        ),
        enabledBorder: outlineBorderPropGenerator(const Color(0xFFEDEFEE)),
        focusedBorder: outlineBorderPropGenerator(const Color(0xFF557A46)),
        focusedErrorBorder: outlineBorderPropGenerator(Colors.red, width: 1.5),
        errorBorder: outlineBorderPropGenerator(Colors.red, width: 1.0),
        contentPadding: const EdgeInsets.all(16),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFA3ADAA),
          fontSize: 14,
        ),
      ),
    );
  }
}

outlineBorderPropGenerator(Color color, {double width = 1.5}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(width: width, color: color),
  );
}
