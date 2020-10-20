import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce/Menu/menu_lateral.dart';
import 'package:flutter_ecommerce/ui/page/category/categories_page.dart';
import 'package:flutter_ecommerce/ui/page/category/category_page.dart';
import 'package:flutter_ecommerce/ui/page/category/filter_page.dart';
import 'package:flutter_ecommerce/ui/page/checkout/cart_page.dart';
import 'package:flutter_ecommerce/ui/page/checkout/checkout_page.dart';
import 'package:flutter_ecommerce/ui/page/home_page.dart';
import 'package:flutter_ecommerce/ui/page/item/item_page.dart';
import 'package:flutter_ecommerce/ui/page/item/item_spec_page.dart';
import 'package:flutter_ecommerce/ui/page/login/login_page.dart';
import 'package:flutter_ecommerce/ui/page/profile/profile_page.dart';
import 'package:flutter_ecommerce/ui/page/register/register_page.dart';
import 'package:flutter_ecommerce/ui/page/search/search_page.dart';
import 'package:flutter_ecommerce/ui/page/settings/settings_page.dart';
import 'package:flutter_ecommerce/ui/page/wishlist/wishlist_page.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-commerce',
      theme: ThemeData(

          primaryColor: Colors.black,
          fontFamily: UIData.defaultFont,
          primarySwatch: Colors.amber
      ),
      home: HomePage(),

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.loginRoute: (BuildContext context) => LoginPage(),
        UIData.registerRoute: (BuildContext context) => RegisterPage(),
    //    UIData.MenuRoute: (BuildContext context) => MenuLatela(),
        UIData.searchRoute: (BuildContext context) => SearchPage(),
        UIData.categoriesRoute: (BuildContext context) => CategoriesPage(),
        UIData.categoryRoute: (BuildContext context) => CategoryPage(),
        UIData.itemRoute: (BuildContext context) => ItemPage(),
        UIData.itemSpecRoute: (BuildContext context) => ItemSpecPage(),
        UIData.cartRoute: (BuildContext context) => CartPage(),
        UIData.checkoutRoute: (BuildContext context) => CheckoutPage(),
        UIData.filterRoute: (BuildContext context) => FilterPage(),
        UIData.wishListRoute: (BuildContext context) => WishlistPage(),
        UIData.profileRoute: (BuildContext context) => ProfilePage(),
        UIData.settingsRoute: (BuildContext context) => SettingPage(),
      },
    );

  }
}
