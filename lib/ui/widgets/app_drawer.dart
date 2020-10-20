import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: Image.asset(UIData.profileImage),
            ),
            accountName: Text(
              UIData.username,
              style: TextStyle(color: AppColors.light, fontSize: 20),
            ),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(UIData.menuBg)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(UIData.homePage),
            onTap: () {
              Navigator.pushNamed(context, UIData.homeRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text(UIData.categoriesPage),
            onTap: () {
              Navigator.pushNamed(context, UIData.categoriesRoute);
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.heart),
            title: Text(UIData.wishListPage),
            onTap: () {
              Navigator.pushNamed(context, UIData.wishListRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text(UIData.myAccountPage),
            onTap: () {
              Navigator.pushNamed(context, UIData.profileRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text(UIData.cartPage),
            onTap: () {
              Navigator.pushNamed(context, UIData.cartRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(UIData.settingsPage),
            onTap: () {
              Navigator.pushNamed(context, UIData.settingsRoute);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(UIData.logout),
            onTap: () {
              Navigator.pushNamed(context, UIData.loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
