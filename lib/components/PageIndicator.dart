import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int numberOfIndicators;

  const PageIndicator({
    Key? key,
    this.currentIndex = 0,
    required this.numberOfIndicators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          numberOfIndicators,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  width: index == currentIndex ? 28 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                      color: index == currentIndex ? const Color(0xFF557A46) : const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(8)),
                ),
              )),
    );
  }
}
