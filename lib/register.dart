// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:responsive_page_login/api/api_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  void createData() {
    ApiService()
        .register(
            name.text, email.text, password.text, password_confirmation.text)
        .then((value) {
      if (value) {
        Alert(
          context: context,
          title: "Berhasil",
          desc: "Berhasil menambahkan register",
          type: AlertType.success,
        ).show();
      } else {
        Alert(
          context: context,
          title: "Gagal",
          desc: "Gagal menambahkan register",
          type: AlertType.error,
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: lebar >= 800
            ? EdgeInsets.symmetric(vertical: 20, horizontal: 40)
            : EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                    )),
                _header(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 18,
                ),
                // _form(context, name, email, password, password_confirmation),
                Column(
                  children: [
                    _field(context, "Email address", email),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    _field(context, "Username", name),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    _field(context, "Password", password),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    _field(context, "Password Confirmation",
                        password_confirmation),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 30),
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          createData();
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: lebar >= 800 ? 30 : 30),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[700],
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 50)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
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
    BuildContext context, String text, TextEditingController controller) {
  final lebar = MediaQuery.of(context).size.width;
  return TextField(
    controller: controller,
    style: TextStyle(fontSize: 20),
    decoration: InputDecoration(
        contentPadding: lebar >= 800
            ? EdgeInsets.symmetric(vertical: 25, horizontal: 20)
            : EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey[600])),
  );
}
