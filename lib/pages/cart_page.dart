import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/cart.dart';
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
        title: "                 CART"
            .text
            .bold
            .color(context.theme.secondaryHeaderColor)
            .make(),
        // backgroundColor: context.canvasColor,
      ),
      body: Column(
        children: [
          _Cartlist().p32().expand(),
          Divider(),
          _Carttotal(),
        ],
      ),
    );
  }
}

class _Carttotal extends StatelessWidget {
  const _Carttotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}"
              .text
              .color(context.theme.secondaryHeaderColor)
              .xl4
              .make(),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(context.theme.buttonColor)),
              onPressed: (() => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: "Buyying is not supported yet".text.make()))),
              child: "Buy".text.color(Colors.white).make())
        ],
      ),
    );
  }
}

class _Cartlist extends StatefulWidget {
  const _Cartlist({super.key});

  @override
  State<_Cartlist> createState() => _CartlistState();
}

class _CartlistState extends State<_Cartlist> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: (() {
                        _cart.remove(_cart.items[index]);
                        setState(() {});
                      }),
                      icon: Icon(Icons.remove)),
                  title: _cart.items[index].name.text.make(),
                )));
  }
}
