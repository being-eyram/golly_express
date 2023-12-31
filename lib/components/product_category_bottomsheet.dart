import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/constants.dart';

class ProductCategoryBottomSheet extends StatelessWidget {
  const ProductCategoryBottomSheet({
    required this.onProductSelect,
    super.key,
  });
  final Function(String product) onProductSelect;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              'select product category',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.shade300,
                  );
                },
                shrinkWrap: true,
                itemCount: productCategories.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    onTap: () {
                      onProductSelect(productCategories[index]);
                    },
                    contentPadding:
                        const EdgeInsets.only(left: 0.0, right: 0.0),
                    title: Text(
                      productCategories[index],
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
