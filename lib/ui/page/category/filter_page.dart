import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/widgets/inline_dropdown.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String shipTo = 'Guatemala';
  String category = 'Vestido';
  String sleeve = 'Todas';
  String fabric = 'Todas';
  bool isFreeShipping = false;
  bool isSaleItems = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            bottom: TabBar(
              indicatorColor: AppColors.light,
              tabs: [
                Tab(text: 'Filtro'),
                Tab(text: 'Atributo'),
              ],
            ),
            title: Text('Resultado de la busqueda(105)'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.close, color: AppColors.primaryText),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          body: TabBarView(
            children: [
              filters(context),
              attributes(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget filters(BuildContext context) => Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            InlineDropdown('Enviar a', ['GT', 'Mexico'], 'GT'),
            price(context),
            freeShipping(context),
            saleItems(context)
          ],
        ),
      );

  Widget attributes(BuildContext context) => Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            InlineDropdown('Categoría', ['Vestido', 'Falda'], 'Vestido'),
            InlineDropdown('Largo de manga', ['Todos'], 'Todos'),
            InlineDropdown('Tipo de Fabrica', ['Todas', 'Algodón'], 'Todas'),
          ],
        ),
      );

  Widget price(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            flex: 20,
            child: Text('Precio'),
          ),
          Expanded(
            flex: 40,
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(signed: false),
              maxLines: 1,
              decoration: InputDecoration(
                labelText: "Min",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.light),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(signed: false),
              maxLines: 1,
              decoration: InputDecoration(
                labelText: "Max",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.light),
                ),
              ),
            ),
          ),
        ],
      );

  Widget freeShipping(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Text('Envio Gratis'),
          ),
          Expanded(
            flex: 50,
            child: Align(
              alignment: Alignment.topRight,
              child: Switch(
                value: isFreeShipping,
                onChanged: (bool value) {
                  setState(() {
                    isFreeShipping = value;
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget saleItems(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Text('Articulos en Venta'),
          ),
          Expanded(
            flex: 50,
            child: Align(
              alignment: Alignment.topRight,
              child: Switch(
                value: isSaleItems,
                onChanged: (bool value) {
                  setState(() {
                    isSaleItems = value;
                  });
                },
              ),
            ),
          ),
        ],
      );
}
