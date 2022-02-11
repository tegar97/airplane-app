import 'package:airplane/ui/pages/bonus_pages.dart';
import 'package:airplane/ui/pages/get_started_pages.dart';
import 'package:airplane/ui/pages/main_pages.dart';
import 'package:airplane/ui/pages/sign_up_dart_pages.dart';
import 'package:airplane/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/get-started': (context) => GetStartedPage(),
        '/sign-up': (context) => SignUpPage(),
        '/bonus': (context) => BonusPage(),
        '/main-page': (context) => MainPage(),
      },
    );
  }
}
