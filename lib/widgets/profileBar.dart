import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/sizeConfig.dart';

class ProfileBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.padding10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: new Image.asset(
                'assets/images/test_img.png',
                height: SizeConfig.profileImgSize,
                width: SizeConfig.profileImgSize,
                fit: BoxFit.cover,
              )
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: SizeConfig.padding17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Фетисов М.Ю.",
                  style: TextStyle(letterSpacing: 0.38, fontSize: SizeConfig.textSize20, fontWeight: FontWeight.w600, color: Colors.white)
              ),
              Text(
                  "Перейти в профиль агента",
                  style: TextStyle(letterSpacing: -0.24, fontSize: SizeConfig.textSize13, fontWeight: FontWeight.w400, color: Color.fromRGBO(255,255,255, 0.6))
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: SizeConfig.padding36),
          child: Icon(
            Icons.navigate_next,
            color: Color.fromRGBO(255, 255, 255, 0.6),
          ),
        )
      ],
    );
  }
}
