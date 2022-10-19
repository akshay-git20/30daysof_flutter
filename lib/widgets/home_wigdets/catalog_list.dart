import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catelog.dart';
import '../../utils/rotes.dart';
import '../themes.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: ((context, index) {
          final item = CatalogModel.items[index];
          return CatalogItem(item: item);
        }));
  }
}

class CatalogItem extends StatelessWidget {
  final Item item;
  const CatalogItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homedetailpage(item: item)));
            }),
            child: Hero(tag: Key(item.id.toString()),child: CatalogImage(image: item.image))),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              item.name.text.bold.color(Mythemes.darkBluishColor).make(),
              item.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${item.price}".text.bold.xl.make(),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all(
                              Mythemes.darkBluishColor)),
                      onPressed: (() {}),
                      child: "Buy".text.bold.make())
                ],
              ).pOnly(right: 8)
            ],
          ),
        )
      ],
    )).white.rounded.square(140).make().py16();
  }
}