import 'package:flutter/material.dart';

class TrackingNumberSearchField extends StatelessWidget {
  const TrackingNumberSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          enabled: true,
          // decoration: InputDecoration(enabled: true, ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Tracking Number',
            hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: const EdgeInsets.only(left: 16.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Container(
            alignment: Alignment.center,
            height: 41,
            width: 41,
            decoration: BoxDecoration(
              color: const Color(0xFF557A46),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
