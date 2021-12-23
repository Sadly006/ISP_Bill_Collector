import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isp_bill_collector/pages/dash_board.dart';
import 'package:shared_preferences/shared_preferences.dart';


validator(email, password, context) async {
  var response = await http.post(
      Uri.parse("https://sadly007.000webhostapp.com/login.php"),
      body:{
        'email':email.text.toString(),
        'password':password.text.toString(),
      }
  );
  if(response.body=="Success") {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email.text.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashBoard()),
    );
  }
  else{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: const Text("Email or Password incorrect"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}