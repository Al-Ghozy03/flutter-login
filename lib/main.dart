// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:responsive_page_login/cek.dart';
import 'package:responsive_page_login/login.dart';
import 'package:responsive_page_login/register.dart';
import 'package:responsive_page_login/reset.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "latihan responsive",
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/reset": (context) => Reset(),
        "/check": (context) => CheckEmail(),
      },
    );
  }
}
