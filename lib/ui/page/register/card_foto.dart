import 'package:flutter/material.dart';

class CardFotos extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardFoto();
  }
}

class CardFoto extends State<CardFotos>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 5.0,
      borderRadius: new BorderRadius.circular(10.0),
      child: InkWell(
        child: Container(
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}