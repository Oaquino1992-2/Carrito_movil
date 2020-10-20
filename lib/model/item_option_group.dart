import 'package:flutter_ecommerce/model/item_option.dart';

class ItemOptionGroup {
  int id;
  String name;
  List<ItemOption> options;

  ItemOptionGroup({this.id, this.name, this.options});
}
