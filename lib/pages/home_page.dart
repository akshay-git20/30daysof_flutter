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
    var catalogjason = await rootBundle.loadString("assets/files/Catalog.json");
    var decodedata = jsonDecode(catalogjason);
    var productsdata = decodedata["products"];
    print(productsdata);
  }

  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Tinder For Sports"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummylist[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
