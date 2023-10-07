import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/product_category_bottomsheet.dart';
import 'package:golly_express/model/my_address_container.dart';

class CalculateEstimateScreen extends StatelessWidget {
  const CalculateEstimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6EDB7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "The amount you will pay for this",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA3ADAA),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "GHS 0.00",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFA3ADAA),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "this includes shipping and taxes",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA3ADAA),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Get Estimate ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return const ProductCategoryBottomSheet();
                      },
                    );
                  },
                  child: const MyAddressContainer(
                    showExpandMore: true,
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  buttonText: "Calculate",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
