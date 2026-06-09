import 'package:asttro/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

        supportedLocales: const [
          Locale('pt', 'BR'), // Suporte ao Português do Brasil
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate, // Exige a configuração de pt-BR para coisas estilo iOS (como o menu contextual)
        ],

        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF09080E), 

          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: NoAnimationPageTransitionsBuilder(),
              TargetPlatform.iOS: NoAnimationPageTransitionsBuilder(),
            },
          ),

          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFF1D61E7),          // cor do palitinho que fica piscando
            selectionHandleColor: Color(0xFF1D61E7), //  cor da bolinha/gotinha de arrastar
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

// === Adicione esta classe ===
class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child; // Retorna o widget diretamente sem nenhuma animação aplicada
  }
}