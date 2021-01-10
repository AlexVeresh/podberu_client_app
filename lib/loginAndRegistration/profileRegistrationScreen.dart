import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/loginAndRegistration/firstLoginScreen.dart';
import 'package:podberu_client_app/mainPage.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/textFieldWidget.dart';

class ProfileRegistrationScreen extends StatefulWidget {
  @override
  _ProfileRegistrationScreenState createState() => _ProfileRegistrationScreenState();
}

class _ProfileRegistrationScreenState extends State<ProfileRegistrationScreen> {
  bool serviceValue = false;
  bool dataValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.padding48),
                    child: SvgPicture.asset(
                          "assets/images/ic_logo.svg",
                          width: MediaQuery.of(context).size.width*0.768,
                          height: MediaQuery.of(context).size.width*0.152,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.padding48, right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal),
                    child: TextFieldWidget(hintText: "ФИО"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.padding24, right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal),
                    child: TextFieldWidget(hintText: "E-mail"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal, top: SizeConfig.padding24),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          highlightColor: Constants.themeColor.withOpacity(0.5),
                          onTap: (){
                            setState(() {
                              serviceValue = !serviceValue;
                            });
                          },
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width*0.067,
                                minHeight: MediaQuery.of(context).size.width*0.067
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: serviceValue ? Constants.themeColor : null,
                                border: Border.all(width: 2, color: Constants.themeColor)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.padding16, top: SizeConfig.padding6),
                          child: RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Я принимаю условия ", style: TextStyle(fontSize: SizeConfig.textSize15, letterSpacing: -0.24, color: Colors.white, fontWeight: FontWeight.w600)),
                                TextSpan(text: "договора"+"\n"+" об оказании услуг", style: TextStyle(decoration: TextDecoration.underline, fontSize: SizeConfig.textSize15, letterSpacing: -0.24, color: Colors.white, fontWeight: FontWeight.w600, height: 0.0))
                              ]
                          ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.paddingHorizontal, right: SizeConfig.paddingHorizontal, top: SizeConfig.padding24),
                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          highlightColor: Constants.themeColor.withOpacity(0.5),
                          onTap: (){
                            setState(() {
                              dataValue = !dataValue;
                            });
                          },
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: MediaQuery.of(context).size.width*0.067,
                                minHeight: MediaQuery.of(context).size.width*0.067
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: dataValue ? Constants.themeColor : null,
                                border: Border.all(width: 2, color: Constants.themeColor)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.padding16, top: SizeConfig.padding6),
                          child: RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Я согласен ", style: TextStyle(fontSize: SizeConfig.textSize15, letterSpacing: -0.24, color: Colors.white, fontWeight: FontWeight.w600)),
                                TextSpan(text: "на обработку"+"\n"+" персональных данных", style: TextStyle(decoration: TextDecoration.underline, fontSize: SizeConfig.textSize15, letterSpacing: -0.24, color: Colors.white, fontWeight: FontWeight.w600, height: 0.0))
                              ]
                          ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.padding24),
                    child: ButtonWidget(
                      title: "Зарегистрироваться",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.padding24, bottom: SizeConfig.padding48),
                    child: InkWell(
                      onTap: () async{
                        await Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstLoginScreen())) ;
                      },
                      child: Text(
                        "У меня есть аккаунт",
                        style: TextStyle(fontSize: SizeConfig.textSize13, fontWeight: FontWeight.w400, letterSpacing: -0.24, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
          ),
      ),
    );
  }
}