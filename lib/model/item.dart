import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/model/item_option_group.dart';
import 'package:flutter_ecommerce/model/review.dart';
import 'package:flutter_ecommerce/model/seller.dart';

class Item extends ChangeNotifier {
  int id;
  int categoryId;
  String name;
  double price;
  double salePrice;
  double shipping;
  int numOrders;
  double rating;
  int numWishList;
  bool onWishList;
  String thumb;
  String shortDesc;
  String desc;
  List<String> images;
  List<ItemOptionGroup> optionGroups;
  List<Review> reviews;
  Seller seller;

  static bool onWishListFlag = false;

  Item(
      {this.id,
      this.categoryId,
      this.name,
      this.price,
      this.salePrice,
      this.shipping,
      this.numOrders,
      this.rating,
      this.numWishList,
      this.onWishList,
      this.thumb,
      this.shortDesc,
      this.desc,
      this.images,
      this.optionGroups,
      this.reviews,
      this.seller});

  bool getOnWishListFlag() {
    return onWishListFlag;
  }

  void setOnWishListFlag(bool wishListFlag) {
    onWishListFlag = wishListFlag;
  }
}
