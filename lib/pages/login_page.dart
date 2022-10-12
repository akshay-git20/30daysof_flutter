// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/rotes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool tap = false;
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
              "Welcome $name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
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
                  InkWell(
                    onTap: () async {
                      setState(() {
                        tap = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homepage);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: tap ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(tap ? 50 : 9)),
                      child: tap?Icon(Icons.done,color: Colors.white,):Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   child: Text("Login", style: TextStyle(fontSize: 20)),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homepage);
                  //   },
                  //   style: TextButton.styleFrom(
                  //       minimumSize: Size(100, 35),
                  //       foregroundColor: Colors.black),
                  // )
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
