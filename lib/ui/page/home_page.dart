import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/addItem.dart';
import 'package:flutter_ecommerce/model/category.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/services/category_service.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/ui/widgets/app_drawer.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  final categoryService = CategoryService();
  final itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text("Inicio"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search, color: AppColors.primaryText),
            onPressed: () => Navigator.pushNamed(context, UIData.searchRoute),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: homeBody(context),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(
              new MaterialPageRoute(builder: (BuildContext context) => new addItem())
          )),
    );
  }

  Widget homeBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            slider(context),
            categories(context),
            deals(context),
            itemsLabel(context),
            items(context)
          ],
        ),
      );

  Widget slider(BuildContext context) => CarouselSlider(
        items: [UIData.slide1, UIData.slide2, UIData.slide3].map((img) {
          return Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(img));
        }).toList(),
        aspectRatio: 125 / 58,
        viewportFraction: 1.0,
      );

  Widget categories(BuildContext context) {
    List<Category> categories = categoryService.getCategoriesForMenu();

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          category(context, categories[0]),
          category(context, categories[1]),
          category(context, categories[2]),
          Expanded(
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Image.asset(UIData.allCategories, fit: BoxFit.cover),
                  Text("Todas las categorias", textAlign: TextAlign.center)
                ],
              ),
              onTap: () => Navigator.pushNamed(context, UIData.categoriesRoute),
            ),
          ),
        ],
      ),
    );
  }

  Widget category(BuildContext context, Category category) => Expanded(
        child: InkWell(
          child: Column(
            children: <Widget>[
              Image.asset(category.thumb, fit: BoxFit.cover),
              Text(category.name, textAlign: TextAlign.center)
            ],
          ),
          onTap: () => Navigator.pushNamed(context, UIData.categoryRoute),
        ),
      );

  Widget deals(BuildContext context) => Center(
        child: Row(
          children: <Widget>[
            dealBlock('Ofertas', '00:00:01', UIData.deal1),
            dealBlock('Super Ofertas', 'Hasta 90% de descuento', UIData.deal2),
          ],
        ),
      );

  Widget dealBlock(label, subLabel, banner) => Expanded(
        child: Card(
          child: Column(
            children: <Widget>[
              Text(label),
              Container(
                padding: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Center(
                  child: Text(subLabel, style: TextStyle(color: Colors.white)),
                ),
              ),
              Image.asset(banner)
            ],
          ),
        ),
      );

  Widget itemsLabel(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          'Solo para ti',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }

  Widget items(BuildContext context) {
    List<Item> items = itemService.getPopularItems();

    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.7,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        controller: ScrollController(keepScrollOffset: false),
        children: items.map((Item item) {
          return Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, UIData.itemRoute),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      item.thumb,
                    ),
                  ),
                  Text(item.name),
                  Center(
                    child: Text(
                      UIData.currency + item.price.toString(),
                      style: TextStyles.price(context),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
