import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/myDocumentsPage.dart';
import 'package:podberu_client_app/myRequestsPage.dart';
import 'package:podberu_client_app/settingsPage.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/cardWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';


class ProfilePage extends StatelessWidget {
  double scoreValue = 20;
  double maxValue = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      appBar: AppBar(
        backgroundColor: Constants.background,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Назад"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.padding16),
            child: IconButton(
                onPressed: ()async{
                   await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                icon: Icon(Icons.settings, size: SizeConfig.iconSizeSm)
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding29),
                child: InkWell(
                    onTap: ()async{
                     // await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: ProfileBar()
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24, left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Constants.themeColor
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.padding16),
                    child: Column(
                      children: [
                        Text(
                          "Ваш персональный"+"\n"+"кредитный рейтинг",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: SizeConfig.textSize17, letterSpacing: -0.24, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.padding24),
                          child: Container(
                            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height/8),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: ShaderMask(
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                          colors: [Color.fromRGBO(205, 0, 27, 1), Color.fromRGBO(253, 229, 98, 1), Color.fromRGBO(0, 205, 126, 1)],
                                        ).createShader(bounds);
                                      },
                                      child: SvgPicture.asset("assets/images/ic_rate.svg")
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                      top: scoreValue == 0
                                          ? 65
                                          : 65-15*sin(pi/(maxValue/scoreValue)),
                                      right: scoreValue == 0
                                          ? 26
                                          : (maxValue/scoreValue) >= 2
                                          ? 26*cos(pi/(maxValue/scoreValue))
                                          : 0,
                                      left: scoreValue > (maxValue/2)
                                          ? -26*cos(pi/(maxValue/scoreValue))
                                          : 0,
                                    ),
                                    alignment: Alignment.center,
                                    child: Transform.rotate(
                                        angle: pi/(maxValue/scoreValue),
                                        child: SvgPicture.asset("assets/images/ic_pointer.svg")
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SizeConfig.padding16),
                          child: Text(
                            "${scoreValue.toInt().toString()} Баллов",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: SizeConfig.textSize17, letterSpacing: -0.24, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding16),
                      child: CardWidget(
                        title: "Мои заявки",
                        description: "Всего 0 заявок",
                        iconPath: "assets/images/ic_request.svg",
                        backgroundColor: Constants.themeColor,
                        onPressed: () async{
                           await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyRequestsPage()));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding16),
                      child: CardWidget(
                        title: "Мои документы",
                        description: "Паспорт, СНИЛС, ИНН",
                        iconPath: "assets/images/ic_documents.svg",
                        backgroundColor: Color.fromRGBO(233, 165, 65, 1),
                        onPressed: () async{
                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyDocumentsPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),
              GridView.count(
                padding: EdgeInsets.only(left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal, top: SizeConfig.padding16, bottom: SizeConfig.padding32),
                crossAxisSpacing: SizeConfig.padding16,
                mainAxisSpacing: SizeConfig.padding16,
                shrinkWrap: true,
                primary: false,
                childAspectRatio: 1.48,// ((MediaQuery.of(context).size.width - (SizeConfig.paddingVertical*2 + SizeConfig.padding16))/2)/(MediaQuery.of(context).size.height/7.5),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: <Widget>[
                  ShortCardWidget(
                    title: "Поддержка",
                    backgroundColor: Constants.themeColor,
                    iconPath: "assets/images/ic_help.svg",
                    onPressed: (){},
                  ),
                  ShortCardWidget(
                    title: "О нас",
                    backgroundColor: Constants.themeColor,
                    iconPath: "assets/images/ic_info.svg",
                    onPressed: (){},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
