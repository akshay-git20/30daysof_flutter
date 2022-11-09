import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catelog.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "                  CART"
            .text
            .bold
            .color(context.theme.secondaryHeaderColor)
            .make(),
        // backgroundColor: context.canvasColor,
      ),
    );
  }
}
