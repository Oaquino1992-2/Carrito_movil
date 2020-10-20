import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/model/item_option.dart';

class CartItem extends ChangeNotifier {
  int id;
  String name;
  double price;
  String thumb;
  int quantity;
  List<ItemOption> itemOptions;

  CartItem({this.id,
    this.name,
    this.price,
    this.thumb,
    this.quantity,
    this.itemOptions
  });
}
