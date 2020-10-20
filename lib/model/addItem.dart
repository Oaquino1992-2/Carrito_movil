import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addItem extends StatefulWidget{
  @override
  _addItemState createState() => _addItemState();
}

class _addItemState extends State<addItem>{
  TextEditingController Pronombre = new TextEditingController();
  TextEditingController Proprice = new TextEditingController();
  TextEditingController Prodescrip = new TextEditingController();
  String url = "http://fluttereco.byethost16.com/control/producto/save.php";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Agregar producto"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child:  new Center(
          child: new Column(
            children: <Widget>[

              new TextField(
                controller: Pronombre,
                decoration: new InputDecoration(
                    labelText: "Producto nombre"
                ),
              ),

              new TextField(
                controller: Proprice,
                decoration: new InputDecoration(
                    labelText: "Producto precio"
                ),
              ),

              new TextField(
                controller: Prodescrip,
                decoration: new InputDecoration(
                    labelText: "Producto descripcion"
                ),
              ),

              new RaisedButton(
                  child: new Text("Agregar"),
                  onPressed: (){

                    final String prono = Pronombre.text;
                    final String prodes = Prodescrip.text;
                    final String proprice = Proprice.text;
                    addItems(prono,prodes,proprice);
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Future<String> addItems(String nom, String descr, String price)  async{


    var respuesta= await http.post(url,headers: {
      'Cookie': "__test=20d2471fc73217c4069624a038a545d5; expires=jueves, 31 de diciembre de 2037 a las 17:55:55; path=/"
    },body: {
      "title": nom,
      "description": descr,
      "price": price
    });
    print (respuesta.body);
  }

}

