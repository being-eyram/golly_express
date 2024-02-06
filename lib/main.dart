import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golly_express/navigation/router.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';
import 'package:google_fonts/google_fonts.dart';

bool? isOnboarded;
bool? isLoggedIn;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isOnboarded = await getUserOnboardStatus();
  // final bearerToken = await getUserBearerToken();
  // isLoggedIn = await getLoginStatus();
  isLoggedIn = await loginStatus();
  await setUserOnboardStatus(true);

  // debugPrint("bearer token: $bearerToken");
  // debugPrint("login status: $isLoggedIn");

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      builder: (_, child) => child!,
      rebuildFactor: (old, data) => false,
      // splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Golly Express',
        theme: ThemeData(
          bottomSheetTheme: const BottomSheetThemeData(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            modalBackgroundColor: Colors.white,
          ),
          // dividerColor: Colors.grey.shade300,
          fontFamily: GoogleFonts.dmSans().fontFamily,
          // appBarTheme: const AppBarTheme(
          //   color: Colors.transparent,
          //   surfaceTintColor: Colors.transparent,
          // ),
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
            // background: Colors.transparent,
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
