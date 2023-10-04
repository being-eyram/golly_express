import 'package:flutter/material.dart';

class Address {
  Address({
    this.addressTitle,
    this.addressLine,
    this.icon,
  });

  String? addressTitle;
  String? addressLine;
  Icon? icon;
}

Address homeAddress = Address(
  addressTitle: "Home",
  addressLine: "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
  icon: const Icon(Icons.home_outlined),
);

Address workAddress = Address(
  addressTitle: "Work",
  addressLine: "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
  icon: const Icon(Icons.work_outline),
);

Address otherAddress = Address(
  addressTitle: "Others",
  addressLine: "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
  icon: const Icon(Icons.location_on_outlined),
);

Address shippingAddress = Address(
  addressTitle: "Others",
  addressLine: "Kpa-Aps Technologies, 6th Adote Obour st, Accra, Ghana",
  icon: const Icon(Icons.location_on_outlined),
);
