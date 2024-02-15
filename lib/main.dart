import 'package:fake_store/ui_pages/home.dart';
import 'package:fake_store/ui_pages/home_structure.dart';
import 'package:fake_store/ui_pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Color(0xff512DA8),
        scaffoldBackgroundColor: Colors.teal.shade100,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
