import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/loginAndRegistration/profileRegistrationScreen.dart';
import 'package:podberu_client_app/loginAndRegistration/secondLoginScreen.dart';
import 'package:podberu_client_app/loginAndRegistration/secondRegistrationScreen.dart';
import 'package:podberu_client_app/mainPage.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/textFieldWidget.dart';

import 'firstLoginScreen.dart';
import 'firstRegistrationScreen.dart';

class FirstLoginAndRegistrationWidget extends StatelessWidget {
  String screenType;
  FirstLoginAndRegistrationWidget({this.screenType});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Constants.background,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                    "assets/images/ic_logo.svg",
                    width: MediaQuery.of(context).size.width*0.768,
                    height: MediaQuery.of(context).size.width*0.152,
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding48, right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal),
                child: TextFieldWidget(hintText: "+7"),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: ButtonWidget(
                  title: screenType == "login" ? "Войти" : "Далее",
                  onPressed: () async{
                    if(screenType == "login"){
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondLoginScreen()));
                    }
                    else{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondRegistrationScreen()));
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24, bottom: SizeConfig.padding24),
                child: InkWell(
                  onTap: () async{
                    if(screenType == "login"){
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstRegistrationScreen())) ;
                    }
                    else{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstLoginScreen())) ;
                    }
                  },
                  child: Text(
                    screenType == "login" ? "Регистрация" : "У меня есть аккаунт",
                    style: TextStyle(fontSize: SizeConfig.textSize13, fontWeight: FontWeight.w400, letterSpacing: -0.24, color: Colors.white),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}

class SecondLoginAndRegistrationWidget extends StatelessWidget {
  String screenType;
  SecondLoginAndRegistrationWidget({this.screenType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                    "assets/images/ic_logo.svg",
                    width: MediaQuery.of(context).size.width*0.768,
                    height: MediaQuery.of(context).size.width*0.152,
                ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding48, right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal),
                child: TextFieldWidget(hintText: "+7 999 888 77 66"),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24, right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal),
                child: TextFieldWidget(hintText: "Код из смс"),
              ),
              screenType == "login"
              ? Container(
                  padding: EdgeInsets.only(top: SizeConfig.padding16, right: SizeConfig.paddingHorizontal),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Не пришло смс?",
                    style: TextStyle(fontSize: SizeConfig.textSize13, fontWeight: FontWeight.w400, letterSpacing: -0.24, color: Color.fromRGBO(255, 255, 255, 0.6)),
                  ),
                )
              : Container(),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: ButtonWidget(
                  title: screenType == "login" ? "Войти" : "Далее",
                  onPressed: () async{
                    if(screenType == "login"){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
                    }
                    else{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileRegistrationScreen())) ;
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24, bottom: SizeConfig.padding24),
                child: InkWell(
                  onTap: () async{
                    if(screenType == "login"){
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstRegistrationScreen())) ;
                    }
                    else{
                      await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstLoginScreen())) ;
                    }
                  },
                  child: Text(
                    screenType == "login" ? "Регистрация" : "У меня есть аккаунт",
                    style: TextStyle(fontSize: SizeConfig.textSize13, fontWeight: FontWeight.w400, letterSpacing: -0.24, color: Colors.white),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
