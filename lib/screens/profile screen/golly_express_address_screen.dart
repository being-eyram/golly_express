import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/model/address_line_container.dart';

class GollyExpressAddressScreen extends StatelessWidget {
  const GollyExpressAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 14,
          bottom: 24.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(color: Color(0xFFEDEFEE)),
            CustomButton(
              buttonText: "Save Changes",
              isEnabled: true,
              onPressed: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          // onPressed: () => context.go("/"),
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Golly Express Address",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 24.0),
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
