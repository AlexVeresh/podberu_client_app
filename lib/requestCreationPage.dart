import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/profilePage.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';
import 'package:podberu_client_app/widgets/textFieldWidget.dart';

class RequestCreationPage extends StatelessWidget {
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
                       await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: ProfileBar()
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: Text(
                  "Оформление заявки",
                  style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize24, fontWeight: FontWeight.w500, letterSpacing: 0.38),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: Text(
                  "Заполните информацию о клиенте",
                  style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize17, fontWeight: FontWeight.w400, letterSpacing: -0.24),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal, vertical: SizeConfig.padding24),
                child: Column(
                  children: [
                    TextFieldWidget(hintText: "ФИО"),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "Дата рождения"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "Серия и номер паспорта"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "Кем выдан"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "Дата выдачи"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "Адрес регистрации"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "Мобильный телефон"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: TextFieldWidget(hintText: "E-mail"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal, bottom: SizeConfig.padding24),
                child: ButtonWidget(
                  title: "Отправить",
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
