import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/bottom_sheet_handle_bar.dart';
import 'package:golly_express/providers/package_category_provider.dart';

class ProductCategoryBottomSheet extends ConsumerWidget {
  const ProductCategoryBottomSheet({
    required this.onProductSelect,
    super.key,
  });

  final Function(String product) onProductSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryData = ref.watch(packageCategoryProvider);

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
          const BottomSheetHandleBar(),
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
          // const SizedBox(height: 16),
          const Text(
            'select product category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          categoryData.when(
            data: (data) {
              var categoryList = data;
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey.shade300,
                      height: 0,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: () {
                        onProductSelect(categoryList[index].name);
                      },
                      contentPadding:
                          const EdgeInsets.only(left: 0.0, right: 0.0),
                      title: Text(
                        categoryList[index].name,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    );
                  }),
                ),
              );
            },
            error: ((error, stackTrace) => Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
