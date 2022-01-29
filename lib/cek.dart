// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 40,
              ),
              height: width / 4,
              width: width / 4,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset("assets/email.png"),
            ),
            Text(
              "Check your email",
              style: TextStyle(
                  fontSize: width >= 800 ? 30 : 40,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold),
            ),
            Text(
                "Link reset password sudah dikirmkan ke email, silahkan diikuti dengan instruksi yang ada",
                style: TextStyle(
                  fontSize: width >= 800 ? 30 : 20,
                  color: Colors.green,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 35),
              width: width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    primary: Colors.green,
                  ),
                  onPressed: () {},
                  child: Text("Buka aplikasi email",
                      style: TextStyle(
                        fontSize: width >= 800 ? 30 : 30,
                      ))),
            ),
            Container(
              width: width,
              child: TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12),
                    primary: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text("Saya akan mengecek nya nanti",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: width >= 800 ? 30 : 25,
                      ))),
            )
          ],
        ),
      )),
    );
  }
}
