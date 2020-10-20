import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/theme/app_colors.dart';
import 'package:flutter_ecommerce/ui/theme/text_styles.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool vibrate = true;
  bool stayAwake = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: false,
        title: Text('Configuraciones'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          vibrateOnTouchBlock(context),
          stayAwakeBlock(context),
          ListTile(
            title: Text('Elija un tono de llamada personalizado'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Almacenamiento'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: Text('Limpiar los datos del historial de efectivo'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      )),
    );
  }

  Widget vibrateOnTouchBlock(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 15, right: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 50,
              child: Text('Vibra al tocarlo',
                  style: TextStyles.tileLabel(context)),
            ),
            Expanded(
              flex: 50,
              child: Align(
                alignment: Alignment.topRight,
                child: Switch(
                    value: vibrate,
                    activeColor: AppColors.accent,
                    onChanged: (bool value) {
                      setState(() {
                        vibrate = value;
                      });
                    }),
              ),
            ),
          ],
        ),
      );

  Widget stayAwakeBlock(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 15, right: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 50,
              child: Text('Estado despierto', style: TextStyles.tileLabel(context)),
            ),
            Expanded(
              flex: 50,
              child: Align(
                alignment: Alignment.topRight,
                child: Switch(
                  value: stayAwake,
                  activeColor: AppColors.accent,
                  onChanged: (bool value) {
                    setState(() {
                      stayAwake = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
