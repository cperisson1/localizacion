import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:localizacion/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('es'), Locale('en'),Locale('ca')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ca'),  //con esto se fuerza el idioma
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage()
    );
  }
}