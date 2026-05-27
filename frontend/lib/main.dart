import 'package:asttro/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light, // Android
    statusBarBrightness: Brightness.dark, // iOS
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Asttro',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF09080E), 

          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // Pode trocar por CupertinoPageTransitionsBuilder se preferir o estilo iOS
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),

          fontFamily: 'Inter',
          useMaterial3: true,

          appBarTheme: const AppBarTheme(
            systemOverlayStyle: overlayStyle,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}