import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

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
    final CartModel _cart = (VxState.store as Mystore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(builder: ((context, store, status) {
            return "\$${_cart.totalprice}"
              .text
              .color(context.theme.secondaryHeaderColor)
              .xl4
              .make();
            
          }), mutations: {Removemutation}),
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

class _Cartlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Removemutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      onPressed: () => Removemutation(item: _cart.items[index]),
                      icon: Icon(Icons.remove)),
                  title: _cart.items[index].name.text.make(),
                )));
  }
}
