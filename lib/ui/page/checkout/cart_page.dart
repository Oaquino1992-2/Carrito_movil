import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/cart_item.dart';
import 'package:flutter_ecommerce/model/cart_seller.dart';
import 'package:flutter_ecommerce/model/item_option.dart';
import 'package:flutter_ecommerce/services/cart_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/container_styles.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/ui/widgets/cart_total.dart';
import 'package:flutter_ecommerce/ui/widgets/inline_dropdown.dart';
import 'package:flutter_ecommerce/ui/widgets/sub_total.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  static final cartService = CartService();
  final sellers = cartService.getSeller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: false,
          title: Text('Carrito')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            shipAddress(context),
            sellersBlock(context, sellers),
            CartTotal(sellers, 'Revisa', () {
              Navigator.pushNamed(context, UIData.checkoutRoute);
            })
          ],
        ),
      ),
    );
  }

  Widget shipAddress(BuildContext context) => Container(
        decoration: ContainerStyles.cardStyle(),
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: InlineDropdown('Envie a', ['GT', 'MX'], 'GT'),
        ),
      );

  Widget sellersBlock(BuildContext context, List<CartSeller> sellers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: sellers.map((CartSeller seller) {
        return Container(
          decoration: ContainerStyles.cardStyle(),
          margin: EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10.0),
                decoration: ContainerStyles.borderBottom(),
                child: Text('Vendedor: ' + seller.name),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: items(context, seller),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: SubTotal(seller),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget items(BuildContext context, CartSeller seller) => Column(
        children: seller.items.map((CartItem item) {
          List<String> optionsName = [];

          item.itemOptions.map((ItemOption option) {
            optionsName.add(option.name);
          }).toList();

          return Row(
            children: <Widget>[
              Expanded(
                flex: 30,
                child: Image.asset(item.thumb),
              ),
              Expanded(
                flex: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.name,
                      style: TextStyles.itemName(context),
                    ),
                    Text(
                      optionsName.join(','),
                      style: TextStyles.hint(),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        UIData.currency + item.price.toString(),
                        style: TextStyles.priceMd(context),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 80,
                          child: qty(context, item),
                        ),
                        Expanded(
                          flex: 20,
                          child: Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                removeItem(context, seller, item);
                              },
                              color: AppColors.gray,
                              icon: Icon(FontAwesomeIcons.trash),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        }).toList(),
      );

  Widget qty(BuildContext context, CartItem item) {
    return Wrap(
      children: <Widget>[
        ButtonTheme(
          minWidth: 36,
          child: RaisedButton(
              onPressed: () {
                minuQty(item);
              },
              color: AppColors.background,
              child: Icon(Icons.remove)),
        ),
        Container(
          width: 40,
          margin: EdgeInsets.only(top: 5.0),
          padding: EdgeInsets.only(top: 5),
          child: Text(
            item.quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        ButtonTheme(
          minWidth: 36,
          child: RaisedButton(
              onPressed: () {
                addQty(item);
              },
              color: AppColors.background,
              child: Icon(Icons.add)),
        ),
      ],
    );
  }

  void addQty(CartItem item) {
    setState(() {
      item.quantity++;
    });
  }

  void minuQty(CartItem item) {
    if (item.quantity < 2) return;

    setState(() {
      item.quantity--;
    });
  }

  void removeItem(BuildContext context, CartSeller seller, CartItem item) {
    setState(() {
      seller.items.removeWhere((carItem) => carItem == item);
    });

    if (seller.items.length == 0) {
      setState(() {
        sellers.removeWhere((cartSeller) => cartSeller == seller);
      });
    }
  }
}
