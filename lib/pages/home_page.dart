import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/widgets/Item_Widegt.dart';

import '../widgets/drawer.dart';

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
      appBar: AppBar(
        title: Text("Tinder For Sports"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)?ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) => ItemWidget(
            item: CatalogModel.items[index],
          ),
        ):Center(child: CircularProgressIndicator(),),
      ),
      drawer: MyDrawer(),
    );
  }
}
