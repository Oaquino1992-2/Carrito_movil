import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/model/cart_item.dart';
import 'package:flutter_ecommerce/model/cart_seller.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';

class SubTotal extends StatelessWidget {
  final CartSeller seller;

  const SubTotal(this.seller);

  @override
  Widget build(BuildContext context) {
    double subTotal = calcSubTotal(context, seller);
    double shipping = seller.shipping;
    double total = subTotal + shipping;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Subtotal'),
            Text(UIData.currency + subTotal.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Shipping'),
            Text(UIData.currency + shipping.toString())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Total'),
            Text(
              UIData.currency + total.toString(),
              style: TextStyles.priceMd(context),
            )
          ],
        ),
      ],
    );
  }

  double calcSubTotal(BuildContext context, CartSeller seller) {
    double subTotal = 0;

    seller.items.map((CartItem item) {
      subTotal += item.price * item.quantity;
    }).toList();

    return subTotal;
  }
}
