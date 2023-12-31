import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/model/address.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({
    super.key,
    required this.address,
  });

  final Address address;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: Colors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            address.addressTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            address.addressLine,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Icon(Icons.location_on_outlined),
            title: Text(
              "Edit Address",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            thickness: 1.5,
            height: 0,
            // color: Color(0xFFEDEFEE),
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            iconColor: Colors.red,
            textColor: Colors.red,
            leading: Icon(Icons.delete_outlined),
            title: Text(
              "Delete Address",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
