import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catelog.dart';

class Addtocart extends StatelessWidget {
  final Item catalog;
  Addtocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [Addmutation,Removemutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    bool isincart = _cart.items.contains(catalog);
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor)),
        onPressed: (() {
          if (!isincart) {
            Addmutation(item: catalog);
          }
        }),
        child: isincart
            ? Icon(Icons.done)
            : Icon(CupertinoIcons.cart_fill_badge_plus));
  }
}
