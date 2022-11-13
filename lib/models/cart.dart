// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // ignore: non_constant_identifier_names
  late CatalogModel _Catlog;

  CatalogModel get catalog => _Catlog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _Catlog = newcatalog;
  }

  final List<int> _itemids = [];

  void remove(Item item) {
    _itemids.remove(item.id);
  }

  List<Item> get items => _itemids.map((id) => _Catlog.getbyid(id)).toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);
}

class Addmutation extends VxMutation<Mystore> {
  Item item;
  Addmutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemids.add(item.id);
  }
}

class Removemutation extends VxMutation<Mystore> {
  Item item;
  Removemutation({
    required this.item,
  });
  @override
  perform() {
    store?.cart._itemids.remove(item.id);
  }
}
