import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    this.first = false,
    this.last = false,
  });
  final bool? first;
  final bool? last;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 8,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "*",
          border: InputBorder.none,
          // enabledBorder: outlineBorderPropGenerator(const Color(0xFFEDEFEE)),
          enabledBorder: outlineBorderPropGenerator(const Color(0x1F000000)),
          focusedBorder: outlineBorderPropGenerator(const Color(0xFF557A46)),
        ),
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
        // textInputAction: TextInputAction.previous,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
          // } else {
          //   FocusScope.of(context).previousFocus();
          // }
        },
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
