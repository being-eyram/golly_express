import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

final showPasswordProvider = StateProvider<bool>((_) => true);

class InputTextField extends ConsumerWidget {
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
  final void Function()? onTapOutside;

  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final AutovalidateMode? autovalidateMode;
  final FloatingLabelBehavior? floatingLabelBehavior;

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
    this.onTapOutside,
    this.validator,
    this.autovalidateMode,
    this.floatingLabelBehavior,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPasswordSvg = SvgPicture.asset(
      'assets/images/ic_show_password.svg',
      semanticsLabel: 'Show Password',
      height: 18.h,
      width: 18.w,
      fit: BoxFit.scaleDown,
    );
    final hidePasswordSvg = SvgPicture.asset(
      'assets/images/ic_hide_password.svg',
      semanticsLabel: 'Hide Password',
      height: 18.h,
      width: 18.w,
      fit: BoxFit.scaleDown,
    );

    // TODO: add show divider option
    return TextFormField(
      // DISMISS KEYBOARD ON OUTSIDE CLICK
      onTapOutside: (event) =>
          onTapOutside ?? FocusManager.instance.primaryFocus?.unfocus(),
      validator: validator,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      controller: controller,
      style: TextStyle(fontSize: 14.5.sp),
      obscureText: isPasswordInput ? isObscured : false,
      decoration: InputDecoration(
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        prefixIcon: prefixIcon,
        suffixIcon: isPasswordInput
            ? InkWell(
                splashColor: Colors.transparent,
                onTap: suffixIconOnTap,
                child: AnimatedContainer(
                  curve: Curves.easeOutSine,
                  duration: const Duration(milliseconds: 200),
                  child: isObscured ? showPasswordSvg : hidePasswordSvg,
                ),
              )
            : suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          borderSide: BorderSide(
            width: 1.5.w,
          ),
        ),
        enabledBorder:
            outlineBorderGenerator(const Color(0xFFEDEFEE), width: 1.5.w),
        focusedBorder: outlineBorderGenerator(const Color(0xFF557A46)),
        focusedErrorBorder: outlineBorderGenerator(Colors.red, width: 1.5.w),
        errorBorder: outlineBorderGenerator(Colors.red, width: 1.0.w),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 13.sp),
        floatingLabelBehavior: floatingLabelBehavior,
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xFFA3ADAA),
          fontSize: 13.sp,
        ),
      ),
    );
  }
}

outlineBorderGenerator(Color color, {double width = 1.5}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.r)),
    borderSide: BorderSide(width: width, color: color),
  );
}
