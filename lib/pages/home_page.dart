// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/utils/rotes.dart';
import 'package:flutter_application_1/widgets/home_wigdets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../widgets/home_wigdets/catalog_header.dart';
import '../widgets/home_wigdets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int day = 30;

  final url = "https://fakestoreapi.com/products";
  @override
  void initState() // It is basically the entry point for the Stateful Widgets.
  {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    
    // var catalogjason = await rootBundle.loadString("assets/files/Catalog.json");
    // var decodedata = jsonDecode(catalogjason);
    // var productsdata = decodedata["products"];
    var response = await http.get(Uri.parse(url));
    var catalogJson = response.body;
    var decodedData = jsonDecode(catalogJson);
    // var productsData = decodedData["products"];
    CatalogModel.items = List.from(decodedData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Mystore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
          builder: ((context, store, status) => FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartpage);
                },
                backgroundColor: context.theme.buttonColor,
                child: Icon(CupertinoIcons.cart),
              ).badge(
                  count: _cart.items.length,
                  textStyle: TextStyle(fontWeight: FontWeight.bold))),
          mutations: {Addmutation, Removemutation}),
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
