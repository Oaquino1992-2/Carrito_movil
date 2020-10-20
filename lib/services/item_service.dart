import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/services/mocks/items_mock.dart';

class ItemService {
  final itemMock = ItemsMock();
  ItemService();

  List<Item> getPopularItems() {
    List<Item> items = itemMock.getItems();

    return items;
  }

  List<Item> getByCategory(int catId) {
    List<Item> items = itemMock.getItems();

    return items.where((item) => item.categoryId == catId).toList();
  }

  Item getById(int id) {
    List<Item> items = itemMock.getItems();

    return items.firstWhere((item) => item.id == id);
  }
}
