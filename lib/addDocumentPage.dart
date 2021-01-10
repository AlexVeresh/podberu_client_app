import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';
import 'package:podberu_client_app/widgets/textFieldWidget.dart';

class AddDocumentPage extends StatelessWidget {
  String documentTag;
  Map pageTypes = { "0" : AddPassport(), "1" : AddSNILS(), "2" : AddITN(), "3" : AddPFR() };
  Map titleTypes = { "0" : "Добавить паспорт", "1" : "Добавить СНИЛС", "2" : "Свидетельство ИНН", "3" : "Свидетельство ПФР" };
  Map btnTypes = { "0" : "Добавить паспорт", "1" : "Добавить СНИЛС", "2" : "Добавить ИНН", "3" : "Добавить ПФР" };
  AddDocumentPage({this.documentTag});
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
                  titleTypes[documentTag],
                  style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize24, fontWeight: FontWeight.w500, letterSpacing: 0.38),
                ),
              ),
              pageTypes[documentTag],
              Padding(
                padding: EdgeInsets.only(right: SizeConfig.paddingHorizontal, left: SizeConfig.paddingHorizontal, bottom: SizeConfig.padding24),
                child: ButtonWidget(
                  title: btnTypes[documentTag],
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

class AddPassport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal, vertical: SizeConfig.padding24),
      child: Column(

        children: [
          TextFieldWidget(hintText: "ФИО"),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.padding24),
            child: TextFieldWidget(hintText: "Серия и номер"),
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
            child: TextField(
              style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
              decoration: InputDecoration(
                enabledBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                hintText: "Скан паспорта",
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                suffixIcon: IconButton(
                    icon: Icon(
                        Icons.add,
                        color: Colors.white,
                    ),
                    onPressed: (){},
                )
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.padding16),
            child: Text(
              "2,3 страница + страница с актуальной" + "\n" + "регистрацией",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize13, fontWeight: FontWeight.w400, letterSpacing: -0.24),
            ),
          )
        ],
      ),
    );
  }
}

class AddSNILS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal, vertical: SizeConfig.padding24),
      child: Column(
        children: [
          TextFieldWidget(hintText: "Номер СНИЛС"),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.padding24),
            child: TextField(
                style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                decoration: InputDecoration(
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "Скан СНИЛС",
                    hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: (){},
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}

class AddITN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal, vertical: SizeConfig.padding24),
      child: Column(
        children: [
          TextFieldWidget(hintText: "ИНН"),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.padding24),
            child: TextField(
                style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                decoration: InputDecoration(
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "Скан свидетельства ИНН",
                    hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: (){},
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}

class AddPFR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal, vertical: SizeConfig.padding24),
      child: Column(
        children: [
          TextFieldWidget(hintText: "Страховой номер ПФР"),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.padding24),
            child: TextField(
                style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                decoration: InputDecoration(
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Constants.themeColor), borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: "Скан свидетельства ПФР",
                    hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: (){},
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}

