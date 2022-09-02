import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:cookbook/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      backgroundColor: Colors.red,
      splash: Lottie.asset(
        'assets/images/gif2.json',
      ),
      nextScreen: HomeScreen(),
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      splashIconSize: 310,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
