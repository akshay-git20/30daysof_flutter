// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:core';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shooter App"
            .text
            .xl5
            .bold
            .color(context.theme.secondaryHeaderColor)
            .make()
            .pOnly(left: 25),
        // "Trending products".text.xl2.make()
        ListTile(
          leading: "Trending products".text.xl2.make(),
          trailing: IconButton(
              onPressed: (() {
                showSearch(context: context, delegate: Mysearch());
              }),
              icon: Icon(Icons.search)),
        )
      ],
    );
  }
}

class Mysearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (() {
            query = '';
          }),
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: (() {
          return close(context, null);
        }),
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return "akshay".text.make();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final item = query.isEmptyOrNull
        ? CatalogModel.items
        : CatalogModel.items
            .where((element) => element.title.startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: item.length,
        itemBuilder: ((context, index) => ListTile(
          
            title: item[index].title.text.make(),
            onTap: () {
              query = item[index].title;
              // Itemss( item: item);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homedetailpage(item: item[index])));
            },
            // title: _cart.items[index].title.text.make(),
          )));
  }
}
