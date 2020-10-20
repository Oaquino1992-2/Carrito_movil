import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/category.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/services/category_service.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryPage extends StatefulWidget {
  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends State<CategoryPage> {
  final itemService = ItemService();
  final categoryService = CategoryService();

  bool listDipslay = true;

  @override
  Widget build(BuildContext context) {
    // use a sample category id
    int catId = 1;
    Category category = categoryService.getCategoryById(catId);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text(category.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: AppColors.primaryText,
            ),
            onPressed: () => Navigator.pushNamed(context, UIData.cartRoute),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[sortBlock(context), items(context, catId)],
        ),
      ),
      bottomNavigationBar: filterBlock(context),
    );
  }

  void toggleList() {
    setState(() {
      listDipslay = !listDipslay;
    });
  }

  Widget sortBlock(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'Mejor Producto',
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: AppColors.gray),
                    onChanged: (String newValue) {},
                    items: <String>[
                      'Mejor Producto',
                      'El precio mas bajo primero',
                      'Precio más alto primero',
                      'No. de pedidos',
                      'Calificación del vendedor'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(listDipslay ? Icons.apps : Icons.list,
                    color: AppColors.gray),
                onPressed: toggleList,
              ),
            ),
          )
        ],
      );

  Widget items(BuildContext context, int catId) {
    List<Item> items = itemService.getByCategory(catId);

    return listDipslay
        ? ListView(
            shrinkWrap: true,
            controller: ScrollController(keepScrollOffset: false),
            children: items.map((item) {
              return itemListBlock(context, item);
            }).toList(),
          )
        : GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 0.6,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            controller: ScrollController(keepScrollOffset: false),
            children: items.map((item) {
              return itemGridBlock(context, item);
            }).toList(),
          );
  }

  Widget itemListBlock(BuildContext context, Item item) => Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.light)),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, UIData.itemRoute),
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
                        itemShipping(context, item),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget itemGridBlock(BuildContext context, Item item) => Card(
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, UIData.itemRoute),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Image.asset(
                  item.thumb,
                  fit: BoxFit.fitWidth,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: itemName(context, item.name),
                ),
                priceBlock(context, item),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(item.shipping > 0
                      ? item.shipping.toString()
                      : 'Envio Gratis'),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(item.numOrders.toString() + ' Pedidos'),
                ),
              ],
            ),
          ),
        ),
      );

  Widget itemName(BuildContext context, String name) =>
      Text(name, style: TextStyles.itemName(context));

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

  Widget itemShipping(BuildContext context, Item item) => Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Text(item.shipping > 0
                  ? item.shipping.toString()
                  : 'Envio Gratis'),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(item.numOrders.toString() + ' Pedidos'),
              ),
            ),
          ],
        ),
      );

  Widget filterBlock(BuildContext context) => BottomNavigationBar(
        onTap: (int index) => Navigator.pushNamed(context, UIData.filterRoute),
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.filter, color: AppColors.gray),
            title: Text('Filtro', style: TextStyle(color: AppColors.gray)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps, color: AppColors.gray),
            title: Text('Atributo', style: TextStyle(color: AppColors.gray)),
          ),
        ],
      );
}
