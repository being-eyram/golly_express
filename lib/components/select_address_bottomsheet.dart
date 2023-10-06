import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/model/address.dart';
import 'package:golly_express/model/my_address_container.dart';

class SelectAddressBottomSheet extends StatelessWidget {
  const SelectAddressBottomSheet({
    super.key,
    required this.onAddressSelect,
  });

  final Function(Address address) onAddressSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      // height: 350,
      child: Wrap(
        // mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 69,
              decoration: BoxDecoration(
                color: const Color(0xFFB5BDBB),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(
                  color: Color(0xFFA3ADAA),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Select address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          ...userAddresses.map(
            (address) => MyAddressContainer(
              address: address,
              onTap: () {
                onAddressSelect(address);
              },
            ),
          ),
          DottedBorder(
            // strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            radius: const Radius.circular(15),
            dashPattern: const [10],
            strokeWidth: 2,
            color: const Color(0xFF557A46),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // border: Border.all(
                //   width: 1.5,
                //   color: const Color(0xFF557A46),
                // ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle,
                    color: Color(0xFF557A46),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Add New Address",
                    style: TextStyle(
                      color: Color(0xFF557A46),
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
