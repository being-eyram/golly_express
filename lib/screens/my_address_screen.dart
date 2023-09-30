import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                  child: const MyAddressContainer(
                    icon: Icon(Icons.home_outlined),
                    addressTitle: "Home",
                    addressLine:
                        "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
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
                              const Text(
                                "Home",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text(
                                  "Edit Address",
                                  style: TextStyle(),
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
                                iconColor: Colors.red,
                                textColor: Colors.red,
                                leading: Icon(Icons.delete_outlined),
                                title: Text(
                                  "Delete Address",
                                  style: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 16),

                const MyAddressContainer(
                  icon: Icon(Icons.work_outline),
                  addressTitle: "Work",
                  addressLine:
                      "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
                ),

                const SizedBox(height: 16),

                const MyAddressContainer(
                  icon: Icon(Icons.location_on_outlined),
                  addressTitle: "Others",
                  addressLine:
                      "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
