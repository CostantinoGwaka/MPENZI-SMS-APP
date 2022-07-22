import 'package:animation/constants/utility.dart';
import 'package:animation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primary = Utility.hexToColor("#27610d");
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
