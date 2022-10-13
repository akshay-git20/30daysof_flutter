import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int day = 30;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tinder For Sports"),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to a $day"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
