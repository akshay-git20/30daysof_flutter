import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int day = 30;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catelog app")),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to a $day"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
