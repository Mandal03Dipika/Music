import 'package:flutter/material.dart';
import 'package:music_app/domain/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        fontFamily: 'avenir',
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.dashboard_page,
    );
  }
}

