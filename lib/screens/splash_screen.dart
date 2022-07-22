import 'package:animation/screens/home_page.dart';
import 'package:animation/constants/utility.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 7),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Utility.primary,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ShowUpAnimation(
                      delayStart: const Duration(seconds: 1),
                      animationDuration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      direction: Direction.vertical,
                      offset: 0.5,
                      child: Lottie.asset(
                        'assets/anime/kopa.json',
                        height: 190,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShowUpAnimation(
                          delayStart: const Duration(seconds: 1),
                          animationDuration: const Duration(seconds: 2),
                          curve: Curves.bounceIn,
                          direction: Direction.horizontal,
                          offset: -0.5,
                          child: Text(
                            "🧡 ",
                            style: GoogleFonts.aBeeZee(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        ShowUpAnimation(
                          delayStart: const Duration(seconds: 1),
                          animationDuration: const Duration(seconds: 2),
                          curve: Curves.bounceIn,
                          direction: Direction.horizontal,
                          offset: 0.5,
                          child: Text(
                            "MPENZI 🧡",
                            style: GoogleFonts.aBeeZee(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 35,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Crafted By Onfon Media (T) LTD.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
