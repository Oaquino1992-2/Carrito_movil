import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/item.dart';
import 'package:flutter_ecommerce/services/item_service.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatelessWidget {
  final itemService = ItemService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text('Buscar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            searchInput(context),
            items(context),
          ],
        ),
      ),
    );
  }

  Widget searchInput(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: "Estoy comprando",
            prefixIcon: Icon(Icons.search),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.light),
            ),
          ),
        ),
      );

  Widget items(BuildContext context) {
    List<Item> items = itemService.getPopularItems();

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        item(items[0].name),
        item(items[1].name),
      ],
    );
  }

  ListTile item(String name) => ListTile(
        title: Text(name),
        leading: Icon(FontAwesomeIcons.history, color: AppColors.gray),
        trailing: Icon(FontAwesomeIcons.times, color: AppColors.gray),
      );
}
