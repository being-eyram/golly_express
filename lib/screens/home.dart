import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/cards/track_package_card.dart';
import 'package:golly_express/cards/verify_id_card.dart';

import '../components/input_field.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 150,
            horizontal: 16.0,
          ),
          child: Column(
            children: [
              VerifyIDCard(),
              SizedBox(height: 16),
              TrackPackageCard(),
            ],
          ),
        ),
      ),
    );
  }
}

// old stuff
// Container(
//         width: double.infinity,
//         color: const Color(0xFfE6EAED),
//         child: GridView.count(
//           crossAxisCount: 3,
//           children: List.generate(6, (index) => Text("$index")),
//         ),
//       ),
