import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';

class ItemButtons extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemButtons(this.item, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            onPressed: () {
              onTap();
            },
            textColor: AppColors.primary,
            child: Text('AGREGAR AL CARRITO'),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: () {
                onTap();
              },
              color: AppColors.primary,
              textColor: AppColors.primaryText,
              child: Text('COMPRAR AHORA'),
            ),
          ),
        ),
      ],
    );
  }
}
