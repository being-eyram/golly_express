import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/input_field.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: const Color(0xFfE6EAED),
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(6, (index) => Text("$index")),
          )),
    );
  }
}
