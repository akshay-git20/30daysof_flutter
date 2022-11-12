import 'package:flutter_application_1/models/catelog.dart';

class CartModel {
  static final cart = CartModel._internal();
  
  CartModel._internal();

  factory CartModel() => cart;

  // ignore: non_constant_identifier_names
  late CatalogModel _Catlog;

  CatalogModel get catalog => _Catlog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _Catlog = newcatalog;
  }

  final List<int> _itemids = [];

  void add(Item item) {
    _itemids.add(item.id);
  }

  void remove(Item item) {
    _itemids.remove(item.id);
  }

  List<Item> get items => _itemids.map((id) => _Catlog.getbyid(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);
}
