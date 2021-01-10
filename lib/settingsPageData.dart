import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';
import 'package:podberu_client_app/widgets/textFieldWidget.dart';


class SettingsPageData extends StatelessWidget {
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
                padding: EdgeInsets.only(top: 29.0),
                child: InkWell(
                    onTap: ()async{
                      // await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: ProfileBar()
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Text(
                  "Изменение данных",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.38),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0, right: 44, left: 44),
                child: TextFieldWidget(hintText: "ФИО"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0, right: 44, left: 44),
                child: TextFieldWidget(hintText: "Телефон"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0, right: 44, left: 44),
                child: TextFieldWidget(hintText: "E-mail"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0, right: 44, left: 44),
                child: ButtonWidget(
                  title: "Изменить",
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
