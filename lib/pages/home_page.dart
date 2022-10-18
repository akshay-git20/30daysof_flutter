// ignore_for_file: prefer_const_constructors

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
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                itemCount: CatalogModel.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      child: GridTile(
                    header: Container(
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.network(item.image),
                    ),
                    footer: Container(
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ));
                }))
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
