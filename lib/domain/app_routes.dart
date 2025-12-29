import 'package:flutter/cupertino.dart';
import 'package:music_app/ui/create_account/create_account_page.dart';
import 'package:music_app/ui/intro/intro_page.dart';
import 'package:music_app/ui/splash/splash_page.dart';

class AppRoutes {

  static const String splash_page="/splash";
  static const String intro_page="/intro";
  static const String create_account_page="/create";


  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page: (context)=>SplashPage(),
    intro_page:(context)=>IntroPage(),
    create_account_page:(context)=>CreateAccountPage(),
  };

}