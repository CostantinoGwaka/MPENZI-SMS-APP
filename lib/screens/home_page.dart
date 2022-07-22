import 'dart:developer';

import 'package:animation/services/send_message_services.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lottie/lottie.dart';
import 'package:intl_phone_field/countries.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //code
  String countryCode = '255';
  String phoneNumber = '';
  int maxNumber = 0;

  //Variables
  bool validMessage = false;

  //app fields
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _msgController = TextEditingController();

  //text logic
  @override
  void initState() {
    super.initState();
    _msgController.addListener(checkMessage);
  }

  void checkMessage() {
    RegExp hexColor = RegExp(
        r'^(MPENZI)#?([a-zA-Z]+)#?([a-zA-Z]+)#?([F|M]{1})#?([0-9]+)#?([a-zA-Z]+)#?([0-9]+)#?([F|M]{1})$');
    setState(() {
      validMessage = hexColor.hasMatch(_msgController.text);
    });
    log("message : " + _msgController.text + " $phoneNumber");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Material(
      child: Scaffold(
        body: SizedBox(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: mediaQuery.padding.top + 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 7.0),
                            child: Lottie.asset(
                              "assets/anime/love.json",
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      child: Text(
                        "Where your meet life partner",
                        style: GoogleFonts.amita(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: IntlPhoneField(
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        initialCountryCode: 'TZ',
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: Colors.black12,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (phone) {
                          setState(() {
                            countryCode =
                                phone.countryCode.toString().substring(1);
                            phoneNumber = countryCode + phone.number;
                          });
                        },
                        onCountryChanged: (country) {
                          log('Country changed to: ' + country.name);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildTextFeild(
                            widgetIcon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            ),
                            controller: _msgController,
                            hint: 'Enter your message',
                            obscure: false,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.start,
                            icon: '',
                          ),
                          _msgController.text.isNotEmpty &&
                                  validMessage == false
                              ? Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "Provide valid msg format",
                                    style: GoogleFonts.aBeeZee(
                                      textStyle:
                                          Theme.of(context).textTheme.headline4,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    validMessage == true
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                RegisterServices.registerUser(
                                  context,
                                  phoneNumber,
                                  _msgController.text,
                                ).then((value) {
                                  if (value['code'] == 200) {
                                    setState(() {
                                      phoneNumber = '';
                                      countryCode = '255';
                                    });
                                    _msgController.clear();
                                  }
                                });
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
                                    "SEND",
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
                        : SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                      "Message format ${phoneNumber.length} Eg. MPENZI#YourNAME#YourLocation#YourGender#Age#SoulMateLocation#DisiredSoulMateAge#DesiredSoulMateGender",
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      child: Text(
                                        "Key Note : For Gender use M for Male and F for female",
                                        style: GoogleFonts.aBeeZee(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFeild({
    required String hint,
    required TextEditingController controller,
    required TextInputType keyboardType,
    bool obscure = false,
    required String icon,
    required TextAlign textAlign,
    required Widget widgetIcon,
  }) {
    return Column(
      children: <Widget>[
        Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(
              color: Colors.red,
              width: 0.15,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  minLines:
                      6, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: textAlign,
                  obscureText: obscure,
                  controller: controller,
                  autocorrect: false,
                  autofocus: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: widgetIcon,
                    ),
                    contentPadding: const EdgeInsets.all(0.0),
                    filled: true,
                    fillColor: Colors.transparent,
                    labelText: hint,
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
