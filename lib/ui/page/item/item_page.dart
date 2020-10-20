import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/model/review.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/container_styles.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/ui/widgets/item_buttons.dart';
import 'package:flutter_ecommerce/ui/widgets/item_price.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemPage extends StatefulWidget {
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  final itemService = ItemService();
  final sliderRatio = 4 / 3;

  void setWishList(Item item) {
    setState(() {
      item.setOnWishListFlag(!item.getOnWishListFlag());
      print(item.getOnWishListFlag());
    });
  }

  @override
  Widget build(BuildContext context) {
    // use sample id
    Item item = itemService.getById(1);

    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: false,
          title: Text(item.name)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            itemDetail(context, item),
            itemOptions(context, item),
            itemDescription(context, item),
            itemFeedback(context, item),
            sellerBlock(context, item)
          ],
        ),
      ),
    );
  }

  Widget slider(BuildContext context, Item item) => CarouselSlider(
        items: item.images.map((img) {
          return Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(img));
        }).toList(),
        aspectRatio: sliderRatio,
        viewportFraction: 1.0,
      );

  Widget itemDetail(BuildContext context, Item item) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: ContainerStyles.cardStyle(),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              slider(context, item),
              Container(
                padding:
                    EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Text(item.shortDesc, textAlign: TextAlign.center),
                    ItemPrice(item),
                    statBlock(context, item),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: screenSize.width / sliderRatio - 25,
            right: 0,
            child: RawMaterialButton(
              onPressed: () {
                setWishList(item);
              },
              child: new Icon(
                FontAwesomeIcons.solidHeart,
                color: item.getOnWishListFlag()
                    ? AppColors.primary
                    : AppColors.gray,
                size: 20.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.white,
              padding: const EdgeInsets.all(15.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget statBlock(BuildContext context, Item item) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.light)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    item.rating.toString(),
                    style: TextStyles.ratingText(context),
                  ),
                  Text(
                    'Comentarios',
                    style: TextStyle(color: AppColors.gray),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    item.numOrders.toString(),
                    style: TextStyles.ratingText(context),
                  ),
                  Text(
                    'Pedidos',
                    style: TextStyle(color: AppColors.gray),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    item.numWishList.toString(),
                    style: TextStyles.ratingText(context),
                  ),
                  Text(
                    'Lista de productos',
                    style: TextStyle(color: AppColors.gray),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget itemOptions(BuildContext context, Item item) => Container(
        decoration: ContainerStyles.cardStyle(),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Paquete, Color',
                            style: Theme.of(context).textTheme.subtitle),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            item.shipping > 0
                                ? item.shipping.toString()
                                : 'Envío gratis',
                            style: TextStyle(color: AppColors.gray),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'SELECT',
                      style: TextStyle(color: AppColors.accent),
                    ),
                  ),
                )
              ],
            ),
            ItemButtons(item, () {
              Navigator.pushNamed(context, UIData.itemSpecRoute);
            }),
          ],
        ),
      );

  Widget itemDescription(BuildContext context, Item item) => Container(
        decoration: ContainerStyles.cardStyle(),
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.light, width: 1.0),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Descripción',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(item.desc),
              ),
            )
          ],
        ),
      );

  Widget itemFeedback(BuildContext context, Item item) {
    String reviewCount = item.reviews.length.toString();

    return Container(
      decoration: ContainerStyles.cardStyle(),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.light, width: 1.0),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Comentarios ($reviewCount)'),
            ),
          ),
          Column(
            children: item.reviews.map((review) {
              return reviewBlock(context, review);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget reviewBlock(BuildContext context, Review review) {
    List<int> stars = List<int>.generate(review.stars, (int index) => index);

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(review.avatar),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            flex: 80,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 5, right: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        review.name,
                        style: TextStyles.userName(),
                      )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: stars.map((index) {
                            return Icon(
                              Icons.star,
                              color: AppColors.primary,
                              size: 12,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      review.time,
                      style: TextStyles.hint(),
                    )),
                Text(review.content),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget sellerBlock(BuildContext context, Item item) => Container(
        decoration: ContainerStyles.cardStyle(),
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.light, width: 1.0),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Información del vendedor',
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.light, width: 1.0),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.topLeft, child: Text(item.seller.name)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          item.seller.rating.toString(),
                          style: TextStyles.ratingText(context),
                        ),
                        Text(
                          'Comentarios',
                          style: TextStyle(color: AppColors.gray),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          item.seller.numOrders.toString(),
                          style: TextStyles.ratingText(context),
                        ),
                        Text('Orders', style: TextStyle(color: AppColors.gray)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          item.seller.numWishList.toString(),
                          style: TextStyles.ratingText(context),
                        ),
                        Text('Lista de productos',
                            style: TextStyle(color: AppColors.gray)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
