import 'package:flutter/material.dart';
import 'package:golly_express/model/address_line_container.dart';

class GollyEpxressAddressScreen extends StatelessWidget {
  const GollyEpxressAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Shipment",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
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
      ),
    );
  }
}
