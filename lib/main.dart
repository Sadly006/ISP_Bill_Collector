import 'package:flutter/material.dart';
import 'package:isp_bill_collector/pages/dash_board.dart';
import 'package:isp_bill_collector/pages/Authentication/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: email == null
          ? const Scaffold(body: SignIn())
          : const Scaffold(body: DashBoard())
    )
  );
}