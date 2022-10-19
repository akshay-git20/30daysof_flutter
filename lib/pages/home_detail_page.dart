import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catelog.dart';

class Homedetailpage extends StatelessWidget {
  final Item item;

  const Homedetailpage({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Mythemes.creamcolor,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "   \$${item.price}".text.bold.xl4.color(Colors.teal).make(),
              ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all(
                              Mythemes.darkBluishColor)),
                      onPressed: (() {}),
                      child: "Buy".text.bold.xl.make())
                  .wh(80, 40)
                  .pOnly(right: 16)
            ],
          ).py16(),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(item.image).box.alignTopCenter.make())
              .h32(context),
          Expanded(
              child: VxArc(
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  height: 30,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        item.name.text.bold
                            .color(Mythemes.darkBluishColor)
                            .xl3
                            .make(),
                        item.desc.text.textStyle(context.captionStyle).make(),
                      ],
                    ).py64(),
                  )))
        ]),
      ).color(Mythemes.creamcolor),
    );
  }
}
