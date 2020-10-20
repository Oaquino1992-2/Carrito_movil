import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text('Mi cuenta')
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(UIData.profileImage),
              ),
              title: Text('Editar Perfil'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            listHeader(context, 'Perfil'),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar perfil'),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Cuentas conectadas'),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Visto recientemente'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.tag),
              title: Text('Ofertas guardadas'),
            ),
            listHeader(context, 'Otras'),
            ListTile(
              leading: Icon(FontAwesomeIcons.chartBar),
              title: Text('Tabla de clasificación'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.userPlus),
              title: Text('Encuentra amantes de la comida'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.home),
              title: Text('Sugerir un restaurante'),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Invitar a amiga'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.question),
              title: Text('Enviar Comentarios'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Sobre Nosotros'),
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text('Nos Califica'),
            ),
          ],
        )
      ),
    );
  }

  Widget listHeader(BuildContext context, String title) => SizedBox(
    width: double.infinity,
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.light
      ),
      padding: EdgeInsets.all(15),
      child: Text(title),
    ),
  );
}
