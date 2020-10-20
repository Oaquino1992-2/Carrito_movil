import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text("Iniciar de sesión"),
      ),
      body: loginBody(context),
    );
  }

  loginBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[loginFields(context)],
        ),
      );

  loginFields(BuildContext context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: "Correo Electronico",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Registrarse",
                  style: TextStyle(color: AppColors.primaryText),
                ),
                color: AppColors.accent,
                onPressed: () {
                  Navigator.pushNamed(context, UIData.homeRoute);
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: Text(
                "¿Olvidaste tu contraseña?",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: FlatButton.icon(
                padding: EdgeInsets.all(10.0),
                color: AppColors.facebook,
                textColor: AppColors.primaryText,
                icon: Icon(FontAwesomeIcons.facebook),
                label: Text('Iniciar con Facebook'),
                onPressed: () {
                  Navigator.pushNamed(context, UIData.homeRoute);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: FlatButton.icon(
                padding: EdgeInsets.all(10.0),
                color: AppColors.primary,
                textColor: AppColors.primaryText,
                icon: Icon(FontAwesomeIcons.google),
                label: Text('Iniciar con Google'),
                onPressed: () {
                  Navigator.pushNamed(context, UIData.homeRoute);
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, UIData.registerRoute),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: '¿Sin Usuario? ',
                      style: TextStyle(color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Regístrate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
