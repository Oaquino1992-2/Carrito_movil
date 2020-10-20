import 'package:flutter_ecommerce/model/cart_item.dart';
import 'package:flutter_ecommerce/model/cart_seller.dart';
import 'package:flutter_ecommerce/model/item_option.dart';

class CartMock {
  getSellers() {
    return <CartSeller>[
      CartSeller(
        id: 1,
        name: "Tecnologia",
        subtotal: 900,
        shipping: 20,
        total: 920,
        items: <CartItem>[
          CartItem(
            id: 1,
            name: "Xiaomi Mi 4",
            price: 300.0,
            thumb: "assets/images/items/item_3.jpg",
            quantity: 1,
            itemOptions: <ItemOption>[
              ItemOption(
                  id: 1,
                  name: "Estándar",
                  price: 0
              ),
              ItemOption(
                  id: 4,
                  name: "MI4 CU LTE White",
                  price: 2
              ),
            ]
          )
        ],
      ),
      CartSeller(
        id: 2,
        name: "Jahurto Inexpensive",
        subtotal: 20,
        shipping: 10,
        total: 30,
        items: <CartItem>[
          CartItem(
            id: 3,
            name: "Zara coat",
            price: 30,
            thumb: "assets/images/items/item_5.jpg",
            quantity: 1,
            itemOptions: <ItemOption>[
              ItemOption(
                  id: 1,
                  name: "XL",
                  price: 0
              ),
              ItemOption(
                  id: 4,
                  name: "Pink",
                  price: 0
              ),
            ]
          )
        ]
      )
    ];
  }
}
