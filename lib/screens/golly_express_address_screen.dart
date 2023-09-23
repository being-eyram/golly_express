import 'package:flutter/material.dart';
import 'package:golly_express/model/address_line_container.dart';

class GollyEpxressAddressScreen extends StatelessWidget {
  const GollyEpxressAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: Color(0xFFEDEFEE)),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 24.0,
            ),
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
                maximumSize: const Size(double.infinity, 54),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Golly Express Address",
                  style: TextStyle(
                    fontSize: 20,
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
        ),
      ),
    );
  }
}
