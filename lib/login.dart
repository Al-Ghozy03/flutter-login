// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:responsive_page_login/api/api_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: lebar >= 800
            ? EdgeInsets.symmetric(vertical: 20, horizontal: 40)
            : EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                ),
                _form(context,name,password),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 30),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: lebar >= 800 ? 30 : 30),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 50)),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.grey, fontSize: 17),
                            children: [
                          TextSpan(text: "Belum punya akun?"),
                          TextSpan(
                              text: " Klik disini",
                              style: TextStyle(color: Colors.green[700])),
                        ])),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget _form(BuildContext context,email, password) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _field(context, "Email address",email),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      _field(context, "Password",password),
      SizedBox(
        height: MediaQuery.of(context).size.height / 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FittedBox(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/reset");
              },
              child: Text(
                "Lupa password?",
                style: TextStyle(color: Colors.green[700], fontSize: 20),
              ),
            ),
          )
        ],
      )
    ],
  );
}

Widget _header(BuildContext context) {
  final lebar = MediaQuery.of(context).size.width;
  return RichText(
      text: TextSpan(
          style:
              TextStyle(color: Colors.green, fontSize: lebar >= 800 ? 50 : 70),
          children: [
        TextSpan(text: "Hello!\n"),
        TextSpan(text: "Welcome to\n"),
        TextSpan(
            text: "MySmk Apps",
            style: TextStyle(
                color: Colors.green[700], fontWeight: FontWeight.bold)),
      ]));
}

Widget _field(
  BuildContext context,
  String text,
  controller
) {
  final lebar = MediaQuery.of(context).size.width;
  return TextField(
    controller: controller,
    style: TextStyle(color: Colors.white, fontSize: 20),
    decoration: InputDecoration(
        contentPadding: lebar >= 800
            ? EdgeInsets.symmetric(vertical: 25, horizontal: 20)
            : EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey[600])),
  );
}
