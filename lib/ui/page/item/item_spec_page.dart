import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/model/item_option.dart';
import 'package:flutter_ecommerce/model/item_option_group.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/container_styles.dart';
import 'package:flutter_ecommerce/ui/widgets/inline_dropdown.dart';
import 'package:flutter_ecommerce/ui/widgets/item_buttons.dart';
import 'package:flutter_ecommerce/ui/widgets/item_price.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';

class ItemSpecPage extends StatefulWidget {
  @override
  ItemSpecPageState createState() => ItemSpecPageState();
}

class ItemSpecPageState extends State<ItemSpecPage> {
  final itemService = ItemService();
  int quantity = 1;
  Map<int, ItemOption> selectOptions = {};
  double totalOptionPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    // use sample id
    Item item = itemService.getById(1);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text('Especificaciones del producto')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            thumbnail(context, item),
            optionGroups(context, item),
            Padding(
              padding: EdgeInsets.all(10),
              child: InlineDropdown('Envie a', ['GT', 'MX'], 'GT'),
            ),
            qty(context),
            buttonsBlock(context, item)
          ],
        ),
      ),
    );
  }

  Widget thumbnail(BuildContext context, Item item) => Container(
    padding: const EdgeInsets.all(10.0),
    decoration: ContainerStyles.borderBottom(),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 25,
          child: Image.asset(item.thumb),
        ),
        Expanded(
          flex: 75,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ItemPrice(item),
            ),
          ),
        )
      ],
    ),
  );

  Widget optionGroups(BuildContext context, Item item) => Column(
    children: item.optionGroups.map((ItemOptionGroup optionGroup) {

      return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: ContainerStyles.borderBottom(),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(optionGroup.name),
                Text(selectOptions[optionGroup.id] != null ? selectOptions[optionGroup.id].name : '')
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: optionGroup.options.map((ItemOption itemOption) {
                  bool itemActived = selectOptions[optionGroup.id] != null
                      && selectOptions[optionGroup.id].id == itemOption.id;

                  return Container(
                    margin: EdgeInsets.only(
                      right: 10
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          selectOptions[optionGroup.id] = itemOption;
                        });
                      },
                      color: AppColors.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: itemActived ? AppColors.primary : AppColors.background
                      )),
                      child: Text(itemOption.name)
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );
    }).toList(),
  );

  Widget qty(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: ContainerStyles.borderBottom(),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text('Cantidad')
          ),
          Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: minuQty,
                color: AppColors.background,
                child: Icon(Icons.remove)
              ),
              Container(
                width: 100,
                margin: EdgeInsets.only(
                  top: 5.0
                ),
                padding: EdgeInsets.only(
                  top: 5
                ),
                child: Text(
                  quantity.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              RaisedButton(
                onPressed: addQty,
                color: AppColors.background,
                child: Icon(Icons.add)
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonsBlock(BuildContext context, Item item) => Container(
    padding: const EdgeInsets.all(10.0),
    child: ItemButtons(item, () {
      Navigator.pushNamed(context, UIData.cartRoute);
    }),
  );

  void addQty() {
    setState(() {
      quantity++;
    });
  }

  void minuQty() {
    if (quantity < 2) return;

    setState(() {
      quantity--;
    });
  }
}
