import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/address_line_container.dart';

class AddressDropdown extends StatelessWidget {
  const AddressDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.6,
          color: const Color(0xFFEDEFEE),
        ),
      ),
      child: ExpansionTile(
        leading: SizedBox(
          child: gollyExpressLogoMini,
        ),
        title: const Text(
          "Your Golly Express Address",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        children: const [
          AddressLineContainer(
            title: "Address Line 1",
            subtitle: "2507 Investors Row, STE 100 Unit D5",
          ),
          SizedBox(height: 16),
          AddressLineContainer(
            title: "Address Line 2",
            subtitle: "1904",
          ),
          SizedBox(height: 16),
          AddressLineContainer(
            title: "City",
            subtitle: "Orlando",
          ),
          SizedBox(height: 16),
          AddressLineContainer(
            title: "Zip Code",
            subtitle: "32837",
          ),
          SizedBox(height: 16),
          AddressLineContainer(
            title: "Phone",
            subtitle: "+1(689) 209-8652",
          ),
        ],
      ),
    );
  }
}
