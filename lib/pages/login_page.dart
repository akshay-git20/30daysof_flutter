// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_png.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "enter username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "enter password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    child: Text("login"),
                    onPressed: () {
                      print("hi akshay");
                    },
                    style: TextButton.styleFrom(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
