import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';

class ItemPrice extends StatelessWidget {
  final Item item;

  const ItemPrice(this.item);

  @override
  Widget build(BuildContext context) {
    if (item.salePrice != null) {
      return Column(
        children: <Widget>[
          Text(
            UIData.currency + item.salePrice.toString(),
            style: TextStyles.price(context),
          ),
          Text(
            UIData.currency + item.price.toString(),
            style: TextStyles.originPrice(context),
          ),
        ],
      );
    }

    return Text(
      UIData.currency + item.price.toString(),
      style: TextStyles.price(context),
    );
  }
}
