import 'package:flutter/material.dart';
import 'package:golly_express/model/address.dart';

class MyAddressContainer extends StatelessWidget {
  const MyAddressContainer({
    super.key,
    this.address,
    this.onTap,
    this.showExpandMore = false,
  });

  final Address? address;
  final Function()? onTap;
  final bool showExpandMore;
  @override
  Widget build(BuildContext context) {
    return address == null
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFEDEFEE),
              ),
            ),
            child: const Row(
              children: [
                Text(
                  "Select address",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA3ADAA),
                  ),
                ),
                Spacer(),
                Icon(Icons.expand_more)
              ],
            ),
          )
        : Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1.5,
                color: const Color(0xFFEDEFEE),
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        // address lines
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  address!.icon,
                                  const SizedBox(width: 8),
                                  Text(
                                    address!.addressTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              showExpandMore
                                  ? const Icon(Icons.expand_more)
                                  : const SizedBox.shrink()
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            address!.addressLine,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    !showExpandMore
                        ? const Icon(Icons.arrow_forward_ios, size: 18)
                        : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
  }
}
