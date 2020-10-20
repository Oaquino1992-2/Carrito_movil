import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/category.dart';
import 'package:flutter_ecommerce/services/category_service.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesPage extends StatelessWidget {
  final itemService = ItemService();
  final categoryService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text('Categorias'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: AppColors.primaryText,
            ),
            onPressed: () => Navigator.pushNamed(context, UIData.cartRoute),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            categories(context),
          ],
        ),
      ),
    );
  }

  Widget categories(BuildContext context) {
    List<Category> cats = categoryService.getAllCategories();

    return ListView(
      shrinkWrap: true,
      children: cats.map((category) {
        return item(context, category.name, category.itemCount);
      }).toList(),
    );
  }

  InkWell item(BuildContext context, String name, int itemCount) => InkWell(
    child: ListTile(
      title: Text("$name ($itemCount)"),
      onTap: () => Navigator.pushNamed(context, UIData.categoryRoute),
    ),
  );
}
