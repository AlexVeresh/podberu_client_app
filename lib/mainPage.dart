import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:podberu_client_app/profilePage.dart';
import 'package:podberu_client_app/requestCreationPage.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/cardWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';

import 'Constants.dart';

class MainPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Constants.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding8),
                child: SvgPicture.asset(
                    "assets/images/ic_logo.svg",
                    width: MediaQuery.of(context).size.width*0.448,
                    height: MediaQuery.of(context).size.width*0.088,
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: InkWell(
                    onTap: ()async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: ProfileBar()
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.padding84, right: SizeConfig.padding84, top: SizeConfig.padding24),
                child: Text(
                  "Добрый день, Максим Юрьевич!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: SizeConfig.textSize24, letterSpacing: 0.38, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
              GridView.count(
                padding: EdgeInsets.only(left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal, top: SizeConfig.padding24),
                crossAxisSpacing: SizeConfig.padding16,
                mainAxisSpacing: SizeConfig.padding16,
                shrinkWrap: true,
                primary: false,
                childAspectRatio: 1.48,// ((MediaQuery.of(context).size.width - (SizeConfig.paddingVertical*2 + SizeConfig.padding16))/2)/(MediaQuery.of(context).size.height/7.5),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: <Widget>[
                  new ShortCardWidget(
                    title: "Кредиты",
                    iconPath: "assets/images/ic_credits.svg",
                    backgroundColor: Color.fromRGBO(7, 196, 123, 1),
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                    },
                  ),
                  new ShortCardWidget(
                    title: "Микрозаймы",
                    iconPath: "assets/images/ic_microzaim.svg",
                    backgroundColor: Color.fromRGBO(7, 196, 123, 1),
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                    },
                  ),
                  new ShortCardWidget(
                    title: "Страхование",
                    iconPath: "assets/images/ic_security.svg",
                    backgroundColor: Color.fromRGBO(65, 133, 233, 1),
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                    },
                  ),
                  new ShortCardWidget(
                    title: "Вклады",
                    iconPath: "assets/images/ic_vklad.svg",
                    backgroundColor: Color.fromRGBO(65, 133, 233, 1),
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                    },
                  ),
                  new ShortCardWidget(
                    title: "Дебетовые " + "\n" + "карты",
                    iconPath: "assets/images/ic_cards.svg",
                    backgroundColor: Color.fromRGBO(127, 75, 249, 1),
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                    },
                  ),
                  new ShortCardWidget(
                    title: "Бизнесу",
                    iconPath: "assets/images/ic_business.svg",
                    backgroundColor: Color.fromRGBO(127, 75, 249, 1),
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal, top: SizeConfig.padding16, bottom: SizeConfig.padding8*4),
                child: CardWidget(
                  title: "Авиабилеты",
                  description: "Поиск лучших цен",
                  iconPath: "assets/images/ic_plane.svg",
                  backgroundColor: Color.fromRGBO(127, 75, 249, 1),
                  onPressed: () async{
                    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestCreationPage()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
