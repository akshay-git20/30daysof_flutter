

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catelog.dart';

class Addtocart extends StatelessWidget {
  final Item catalog;
  Addtocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isincart = _cart.items.contains(catalog);
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor)),
        onPressed: (() {
          if (!isincart) {
            isincart = isincart.toggle();
            final _catalog = CatalogModel();
            _cart.catalog = _catalog;
            _cart.add(
                catalog); //yahpe wodget isliye dala hai ki woh harr barrr update karate rahe ye koi lockl variable
            //nahi hai isliye wahape widget jaruri hai
            // setState(() {});
          }
        }),
        child: isincart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_fill_badge_plus));
  }
}
