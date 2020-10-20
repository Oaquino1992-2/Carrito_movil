import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/cart_item.dart';
import 'package:flutter_ecommerce/model/cart_seller.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/container_styles.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';

class CartTotal extends StatelessWidget {
  final List<CartSeller> sellers;
  final String buttonName;
  final VoidCallback onTap;

  const CartTotal(this.sellers, this.buttonName, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ContainerStyles.cardStyle(),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Total', style: TextStyles.itemName(context),),
                Text(UIData.currency + calcTotal(context, sellers).toString(), style: TextStyles.price(context),)
              ],
            ),
          ),
          Expanded(
            flex: 40,
            child: RaisedButton(
              onPressed: onTap,
              color: AppColors.primary,
              textColor: AppColors.primaryText,
              child: Text(buttonName),
            ),
          ),
        ],
      ),
    );
  }

  double calcSubTotal(BuildContext context, CartSeller seller) {
    double subTotal = 0;

    seller.items.map((CartItem item) {
      subTotal += item.price * item.quantity;
    }).toList();

    return subTotal;
  }

  double calcTotal(BuildContext context, List<CartSeller> sellers) {
    double total = 0;

    sellers.map((CartSeller seller) {
      total += calcSubTotal(context, seller) + seller.shipping;
    }).toList();

    return total;
  }
}
