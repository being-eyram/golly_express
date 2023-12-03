import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golly_express/navigation/router.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';
import 'package:google_fonts/google_fonts.dart';

bool? isOnboarded;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isOnboarded = await getUserOnboardStatus();
  await setUserOnboardStatus(true);

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

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Golly Express',
          theme: ThemeData(
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
              modalBackgroundColor: Colors.white,
            ),
            // dividerColor: Colors.grey.shade300,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            appBarTheme: const AppBarTheme(color: Colors.white),
            textTheme: GoogleFonts.dmSansTextTheme(baseTextTheme),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF557A46),
                foregroundColor: Colors.white,
              ),
            ),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF557A46),
            ).copyWith(
              background: Colors.white,
            ),
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}
