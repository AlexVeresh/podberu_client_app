import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/sizeConfig.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  GestureTapCallback onPressed;

  ButtonWidget({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed != null ? onPressed : (){},
      child: Container(
        constraints: BoxConstraints(
            minWidth: title == "Изменить персональные данные" ? double.infinity : SizeConfig.screenWidth*53
        ),
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding16, vertical: SizeConfig.padding15),
        decoration: BoxDecoration(
          color: Constants.themeColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
        ),
      ),
    );
  }
}
