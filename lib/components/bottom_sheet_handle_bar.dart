import 'package:flutter/material.dart';

class BottomSheetHandleBar extends StatelessWidget {
  const BottomSheetHandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.18,
        child: Container(
          height: 4.5,
          decoration: BoxDecoration(
            // color: theme.dividerColor,
            color: const Color(0xFFB5BDBB),
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
      ),
    );
  }
}
