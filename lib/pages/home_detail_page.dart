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
          shadowColor: Mythemes.creamcolor,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "   \$${item.price}".text.bold.xl4.color(Colors.teal).make(),
              ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.buttonColor)),
                      onPressed: (() {}),
                      child: "Buy".text.color(context.cardColor).bold.xl.make())
                  .wh(80, 40)
                  .pOnly(right: 16)
            ],
          ).py16(),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(item.image)
                      .box
                      .alignTopCenter
                      .make()
                      .color(context.canvasColor))
              .h32(context),
          Expanded(
              child: VxArc(
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  height: 30,
                  child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(
                      children: [
                        item.name.text.bold
                            .color(context.theme.secondaryHeaderColor)
                            .xl3
                            .make(),
                        item.desc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .make(),
                        "Eos sit ut eirmod diam et at amet sadipscing diam. Et voluptua gubergren dolores diam. Dolor ut vero labore justo. Takimata dolores at dolor sed. Takimata erat voluptua clita elitr lorem, amet tempor et kasd at sit sed, consetetur magna consetetur ipsum diam invidunt, justo dolore dolor justo rebum labore."
                            .text
                            .textStyle(context.captionStyle)
                            .size(13)
                            .make()
                            .pOnly(left: 8)
                            .p24()
                      ],
                    ).py64(),
                  )).color(context.canvasColor))
        ]),
      ).color(context.canvasColor),
    );
  }
}
