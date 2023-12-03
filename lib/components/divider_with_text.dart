import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.text,
    this.height = 12,
  });

  final String text;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: height,
            ),
          ),
        ),
        Text(text),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
