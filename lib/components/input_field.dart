import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final bool isPasswordInput;
  final void Function()? onTapObscureText;

  const InputTextField({
    super.key,
    this.obscureText = false,
    this.isPasswordInput = false,
    required this.hintText,
    this.onTapObscureText,
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

    return TextFormField(
      obscureText: obscureText == true,
      decoration: InputDecoration(
          suffixIcon: isPasswordInput
              ? InkWell(
                  onTap: onTapObscureText,
                  child: AnimatedContainer(
                    curve: Curves.easeOutSine,
                    duration: const Duration(milliseconds: 200),
                    child: obscureText ? showPasswordSvg : hidePasswordSvg,
                  ),
                )
              : null,
          enabledBorder: outlineBorderPropGenerator(const Color(0xFFEDEFEE)),
          focusedBorder: outlineBorderPropGenerator(const Color(0xFF557A46)),
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFA3ADAA))),
    );
  }
}

outlineBorderPropGenerator(Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(width: 2, color: color),
  );
}
