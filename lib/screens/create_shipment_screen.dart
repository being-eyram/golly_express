import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/components/select_address_bottomsheet.dart';
import 'package:golly_express/model/address.dart';
import 'package:golly_express/model/my_address_container.dart';

class CreateShipmentScreen extends StatefulWidget {
  const CreateShipmentScreen({super.key});

  @override
  State<CreateShipmentScreen> createState() => _CreateShipmentScreenState();
}

class _CreateShipmentScreenState extends State<CreateShipmentScreen> {
  Address? selectedAddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            const SizedBox(
              height: 6,
            ),
            CustomButton(
              buttonText: "Create Shipment",
              isEnabled: true,
              onPressed: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Shipment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24.0),
                const InputTextField(
                  hintText: "Tracking number",
                ),
                const SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SelectAddressBottomSheet(
                          onAddressSelect: (address) {
                            setState(() {
                              selectedAddress = address;
                            });
                            context.pop();
                          },
                        );
                      },
                    );
                  },
                  child: MyAddressContainer(
                    showExpandMore: true,
                    address: selectedAddress,
                  ),
                ),
                const SizedBox(height: 24.0),
                const InputTextField(
                  hintText: "Describe product",
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
