import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/settingsPageData.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsOn = true;

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
          title: Text("Назад")
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
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: Text(
                  "Настройки",
                  style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize24, fontWeight: FontWeight.w500, letterSpacing: 0.38),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: Text(
                  "Уведомления",
                  style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize17, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          notificationsOn = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: notificationsOn ? Constants.themeColor : null,
                            border: Border.all(width: 1, color: Constants.themeColor),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5))),
                        width: (MediaQuery.of(context).size.width-SizeConfig.paddingHorizontal*2) / 2,
                        height: SizeConfig.padding48,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(
                              "вкл",
                              style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          notificationsOn = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: !notificationsOn ? Color.fromRGBO(233, 165, 65, 1) : null,
                            border: Border.all(width: 1, color: Color.fromRGBO(233, 165, 65, 1)),//: Color.fromRGBO(233, 165, 65, 1),
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5))),
                        width: (MediaQuery.of(context).size.width-SizeConfig.paddingHorizontal*2) / 2,
                        height: SizeConfig.padding48,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(
                              "выкл",
                              style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24, right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal),
                child: ButtonWidget(
                    title: "Изменить персональные данные",
                    onPressed: () async{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPageData()));
                    },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4.7, bottom: SizeConfig.padding32),
                child: Text(
                  "Выйти из аккаунта",
                  style: TextStyle(color: Color.fromRGBO(249, 75, 98, 1), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

