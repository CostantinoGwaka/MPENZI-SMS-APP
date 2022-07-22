import 'package:animation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: mediaQuery.padding.top + 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Lottie.asset(
                    "assets/anime/done.json",
                    width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Your Informations has been received. Please take your time our system will find perfect paterner for you.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            5.0,
                          ),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.35,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "BACK",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.5,
                            letterSpacing: 1.9,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
