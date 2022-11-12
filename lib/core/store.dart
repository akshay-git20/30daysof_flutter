import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class Mystore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

  Mystore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
