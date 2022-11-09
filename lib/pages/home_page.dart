// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/utils/rotes.dart';
import 'package:flutter_application_1/widgets/Item_Widegt.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import '../widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_wigdets/catalog_header.dart';
import '../widgets/home_wigdets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int day = 30;
  @override
  void initState() // It is basically the entry point for the Stateful Widgets.
  {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogjason = await rootBundle.loadString("assets/files/Catalog.json");
    var decodedata = jsonDecode(catalogjason);
    var productsdata = decodedata["products"];
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartpage);
        },
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator().centered(),
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
