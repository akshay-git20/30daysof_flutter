import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_wigdets/Add_to_cart.dart';
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
              Addtocart(
                catalog: item,
              ).wh(140, 40).pOnly(right: 16)
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
                              item.title.text.bold
                                  .color(context.theme.secondaryHeaderColor)
                                  .xl2
                                  .make()
                                  .pOnly(left: 16),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: item.description.text
                                    .textStyle(context.captionStyle)
                                    .xl
                                    .make()
                                    .pOnly(left: 16),
                              ).expand()
                            ],
                          ).pOnly(top: 64)))
                  .color(context.canvasColor)),
        ]),
      ).color(context.canvasColor),
    );
  }
}
