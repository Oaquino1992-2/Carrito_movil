import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ecommerce/Menu/menu_lateral.dart';
import 'package:flutter_ecommerce/ui/page/register/card_foto.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';

void main()=> runApp(RegisterPage());
class RegisterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registrar',
      theme: ThemeData(
          primarySwatch: Colors.orange
      ),
      home: HomePage1(title: 'Registrar'),
    );
  }
}
class HomePage1 extends StatelessWidget{
  final String title;
  HomePage1({Key key, this.title}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: UsuarioForm(),
      //  drawer: MenuLatela()
    );
  }
}
class UsuarioForm extends StatefulWidget{
  @override
  UsuarioFormState createState() {
    // TODO: implement createState
    return UsuarioFormState();
  }
}
class UsuarioFormState extends State<UsuarioForm> {
  final _formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var Nombre = TextEditingController();
  var Apellido = TextEditingController();
  List _emoji = ["😀", "😁", "😛", "😠"];
  String _currentEmoji;
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState(){
    _dropDownMenuItems = getDropDownMenuItems();
    _currentEmoji = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
            child: CardFotos(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0),
              decoration: new InputDecoration(
                labelText: "Ingrese Nombres",
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),

              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese sus nombres';
                }
              },
              controller: Nombre,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 20.0),
              decoration: new InputDecoration(
                labelText: "Ingrese Apellido",
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.person),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),


              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor ingrese sus apellidos';
                }
              },
              controller: Apellido,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 20.0),
              decoration: new InputDecoration(
                labelText: "Ingrese Email",
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.email),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),


              ),
              // ignore: missing_return
              validator: validateEmail,
              controller: email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: TextFormField(
              obscureText: true,
              style: TextStyle(fontSize: 20.0),
              decoration: new InputDecoration(
                labelText: "Ingrese contraseña",
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.enhanced_encryption),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),


              ),
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return 'por favor ingrese su contraseña';
                }
              },
              controller: password,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child:DropdownButton(
              value: _currentEmoji,
              items: _dropDownMenuItems,
              onChanged: changeDropDownItem,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 16.0, horizontal: 10.0),
            child: MaterialButton(
              minWidth: 200.0,
              height: 60.0,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Procesando Datos ${_currentEmoji}')));
                }
              },
              color: Colors.lightBlue,
              child: Text('Registrar',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String item in _emoji) {
      items.add(new DropdownMenuItem(
        value: item,
        child: new Text(item,
            style: TextStyle(
              fontSize: 35,
            )),
      ));
    }
    return items;
  }

  void changeDropDownItem(String selectedEmoji) {
    setState(() {
      _currentEmoji = selectedEmoji;
    });
  }
  String validateEmail(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value.isEmpty){
      return 'Por favor ingrese el correo';
    }else{
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)){
        return 'Ingrese un correo valido ';
      }else{
        return null;
      }
    }
  }
}



