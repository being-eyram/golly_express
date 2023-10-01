import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/my_address_container.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Color(0xFFEDEFEE),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 24.0,
            ),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFE8E9E8),
                minimumSize: const Size(double.infinity, 54),
                maximumSize: const Size(double.infinity, 54),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Add Address",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFA3ADAA),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          // onPressed: () {
          //   Navigator.pop(context);
          // },
          onPressed: () => context.pop(),

          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Address",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24.0),

                // address container
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  child: MyAddressContainer(
                    icon: const Icon(Icons.home_outlined),
                    addressTitle: "Home",
                    addressLine: homeAddress,
                  ),
                  onTap: () {
                    _displayBottomSheet(context);
                  },
                ),

                const SizedBox(height: 16),

                MyAddressContainer(
                  icon: const Icon(Icons.work_outline),
                  addressTitle: "Work",
                  addressLine: workAddress,
                ),

                const SizedBox(height: 16),

                MyAddressContainer(
                  icon: const Icon(Icons.location_on_outlined),
                  addressTitle: "Others",
                  addressLine: otherAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContainer(),
      },
    );
  }
}
