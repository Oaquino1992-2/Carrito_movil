import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  static final itemService = ItemService();
  List<Item> items = itemService.getPopularItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: false,
          title: Text('Lista de productos')),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          children: items.map((item) {
            return itemListBlock(context, item);
          }).toList(),
        ),
      ),
    );
  }

  Widget itemListBlock(BuildContext context, Item item) => Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.light))),
        child: InkWell(
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 40,
                  child: Image.asset(item.thumb),
                ),
                Expanded(
                  flex: 60,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        itemName(context, item.name),
                        priceBlock(context, item),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                removeItem(context, item);
                              },
                              color: AppColors.gray,
                              icon: Icon(FontAwesomeIcons.trash),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget itemName(BuildContext context, String name) => Text(
        name,
        style: TextStyles.itemName(context),
      );

  Widget priceBlock(BuildContext context, Item item) {
    if (item.salePrice != null) {
      return Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              UIData.currency + item.salePrice.toString(),
              style: TextStyles.price(context),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              UIData.currency + item.price.toString(),
              style: TextStyles.originPrice(context),
            ),
          ),
        ],
      );
    }

    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            UIData.currency + item.price.toString(),
            style: TextStyles.price(context),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(''),
        ),
      ],
    );
  }

  void removeItem(BuildContext context, Item item) {
    setState(() {
      items.removeWhere((itm) => itm == item);
    });
  }
}
