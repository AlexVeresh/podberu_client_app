import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/sizeConfig.dart';

class CardWidget extends StatelessWidget {
  String title;
  String description;
  String iconPath;
  Color backgroundColor;
  GestureTapCallback onPressed;

  CardWidget({this.title, this.description, this.iconPath, this.backgroundColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed != null ? onPressed : (){},
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding16, vertical: SizeConfig.padding22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: backgroundColor
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: SizeConfig.textSize17, letterSpacing: -0.24, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.padding8),
                  child: Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: SizeConfig.textSize15, letterSpacing: -0.24, color: Color.fromRGBO(255, 255, 255, 0.6)),
                  ),
                )
              ],
            ),
            Spacer(),
            SvgPicture.asset(
                iconPath,
                width: SizeConfig.iconSizeMid,
                height: SizeConfig.iconSizeMid,
            )
          ],
        ),
      ),
    );
  }
}


class ShortCardWidget extends StatelessWidget {
  String title;
  String iconPath;
  Color backgroundColor;
  GestureTapCallback onPressed;

  ShortCardWidget({this.title, this.iconPath, this.backgroundColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        //constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/100),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: backgroundColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.padding10, bottom: SizeConfig.padding10, left: 16.0),
              child: SvgPicture.asset(
                  iconPath,
                  height: title.length >= 15 ? SizeConfig.iconSizeSm : SizeConfig.iconSizeMid,
                  width: title.length >= 15 ? SizeConfig.iconSizeSm : SizeConfig.iconSizeMid
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.padding8, left: SizeConfig.padding16),
              child: Text(
                title,
                style: TextStyle(fontSize: SizeConfig.textSize15, letterSpacing: -0.24, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}


