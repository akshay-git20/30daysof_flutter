import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    int day = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog app"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to $day"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
