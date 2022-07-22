import 'dart:convert';
import 'dart:developer';
import 'package:animation/constants/alerts.dart';
import 'package:animation/screens/done_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import '../constants/apiurl.dart';
import '../constants/popup_feedback.dart';

class RegisterServices {
  //register
  static Future<dynamic> registerUser(context, phone, message) async {
    Alerts.showProgressDialog(context, "Please wait..");
    String myApi = "${ApiUrl.bASEURL}/send_message.php";

    final response = await http.post(
      Uri.encodeFull(myApi),
      // headers: {"content-type": "application/json"},
      body: {"phone": phone, "message": message},
    );

    var jsonResponse = json.decode(response.body);

    if (jsonResponse['status'] == "201") {
      Navigator.pop(context);
      popUpFeedback(
        context,
        message: jsonResponse['message'],
        title: "Fail",
        icon: Icons.error,
        colors: Colors.red,
        position: FlushbarPosition.TOP,
      );
      return {
        "code": jsonResponse['status'],
        "msg": jsonResponse['message'],
        "body": jsonResponse['data'],
      };
    } else if (jsonResponse['status'] == "300") {
      Navigator.pop(context);
      popUpFeedback(
        context,
        message: jsonResponse['message'],
        title: "Error",
        icon: Icons.error,
        colors: Colors.red,
        position: FlushbarPosition.TOP,
      );
      return {
        "code": jsonResponse['status'],
        "msg": jsonResponse['message'],
        "body": jsonResponse['data'],
      };
    } else {
      Navigator.pop(context);
      popUpFeedback(
        context,
        message: "Created successfully",
        title: "Successfully",
        icon: Icons.done,
        colors: Theme.of(context).primaryColor,
        position: FlushbarPosition.TOP,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const DoneScreen(),
        ),
        (route) => false,
      );
    }
  }
}
