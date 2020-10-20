import 'cart_item.dart';

class CartSeller {
  int id;
  String name;
  double shipping;
  double subtotal;
  double total;
  List<CartItem> items;

  CartSeller({
    this.id,
    this.name,
    this.shipping,
    this.subtotal,
    this.total,
    this.items
  });
}
