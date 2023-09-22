import 'package:flutter_svg/svg.dart';
import 'package:golly_express/constants.dart';

class Package {
  Package({
    this.name,
    this.id,
    this.icon,
  });

  String? name;
  String? id;
  SvgPicture? icon;
}

// recent/ tracking packages (sample data)
var recentPackages = [
  Package(
    name: "Eyram's MacBook Pro",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Joe's Petite",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
  Package(
    name: "Product Name Goes Here",
    id: "#1234455",
    icon: genericPackageIcon,
  ),
];
