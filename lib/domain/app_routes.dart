import 'package:flutter/cupertino.dart';
import 'package:music_app/ui/create_account/create_account_page.dart';
import 'package:music_app/ui/dashboard/dashboard_screen.dart';
import 'package:music_app/ui/intro/choose_artist_page.dart';
import 'package:music_app/ui/intro/choose_podcast_page.dart';
import 'package:music_app/ui/intro/intro_page.dart';
import 'package:music_app/ui/splash/splash_page.dart';

class AppRoutes {

  static const String splash_page="/splash";
  static const String intro_page="/intro";
  static const String create_account_page="/create";
  static const String choose_artist_page="/artist";
  static const String choose_podcast_page="/podcast";
  static const String dashboard_page="/dashboard";

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page: (context)=>SplashPage(),
    intro_page:(context)=>IntroPage(),
    create_account_page:(context)=>CreateAccountPage(),
    choose_artist_page:(context)=>ChooseArtistPage(),
    choose_podcast_page:(context)=>ChoosePodcastPage(),
    dashboard_page:(context)=>DashboardScreen(),
  };

}