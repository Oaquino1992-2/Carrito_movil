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
import 'package:flutter_ecommerce/ui/widgets/sub_total.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';

class CheckoutPage extends StatefulWidget {
  @override
  CheckoutPageState createState() => CheckoutPageState();
}

class CheckoutPageState extends State<CheckoutPage> {
  static final cartService = CartService();
  final sellers = cartService.getSeller();

  int quantity = 1;
  Map<int, ItemOption> selectOptions = {};
  double totalOptionPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: false,
          title: Text('Revisa')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            shipAddress(context),
            sellersBlock(context, sellers),
            CartTotal(sellers, 'Realizar Pedido', () {
              onPlaceOrder();
            })
          ],
        ),
      ),
    );
  }

  Widget shipAddress(BuildContext context) => Container(
        decoration: ContainerStyles.cardStyle(),
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10.0),
              child: Text('Direccion de Envío'),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10.0),
              color: AppColors.light,
              child: Text(
                'Introduzca la direccion de envío',
                style: TextStyle(color: AppColors.accent),
              ),
            ),
          ],
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
                  padding: EdgeInsets.all(10.0), child: items(context, seller)),
              Container(padding: EdgeInsets.all(10.0), child: SubTotal(seller))
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

          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 30,
                  child: Image.asset(item.thumb),
                ),
                Expanded(
                  flex: 70,
                  child: IntrinsicHeight(
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
                                child: Text(
                                  UIData.currency + item.price.toString(),
                                  style: TextStyles.priceMd(context),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      );

  Widget qty(BuildContext context, CartItem item) {
    return Text(item.quantity.toString() + ' x');
  }

  Future onPlaceOrder() => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text("Alerta"),
        content: new Text('Tu pedido ha sido enviado'),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(
              'Cerrar',
              style: TextStyle(color: AppColors.primary),
            ),
            onPressed: () {
              Navigator.pushNamed(context, UIData.homeRoute);
            },
          ),
        ],
      );
    },
  );
}
