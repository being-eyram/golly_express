import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/screens/navigation/router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Golly Express',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF557A46),
        ),
        textTheme: GoogleFonts.dmSansTextTheme(baseTextTheme),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
