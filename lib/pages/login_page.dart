// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/rotes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool tap = false;

  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        tap = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homepage);
      setState(() {
        tap = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 50,
              ),
              "Welcome $name".text.xl4.center.make().p16(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username can not be empty";
                        }

                        return null;
                      },
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password can not be empty";
                        } else if (value.length < 6) {
                          return "password can not be less than 6";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(tap ? 50 : 9),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: tap ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: tap
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : "Login"
                                  .text
                                  .color(context.cardColor)
                                  .xl2
                                  .make(),
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
          ),
        ));
  }
}
