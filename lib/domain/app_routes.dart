import 'package:flutter/cupertino.dart';
import 'package:music_app/ui/splash/splash_page.dart';

class AppRoutes {

  static const String splash_page="/splash";
  static const String intro_page="/splash";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page: (context)=>SplashPage(),
    intro_page:(context)=>SplashPage()
  };

}