import 'package:flutter_ecommerce/model/cart_seller.dart';
import 'package:flutter_ecommerce/services/mocks/cart_mock.dart';

class CartService {
  final cartMock = CartMock();
  CartService();

  List<CartSeller> getSeller() =>  cartMock.getSellers();
}
