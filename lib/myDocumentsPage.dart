import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/addDocumentPage.dart';
import 'package:podberu_client_app/sizeConfig.dart';
import 'package:podberu_client_app/widgets/cardWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';

class MyDocumentsPage extends StatelessWidget {
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
                    onTap: () async{
                      // await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: ProfileBar()
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding24),
                child: Text(
                  "Мои документы",
                  style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize24, fontWeight: FontWeight.w500, letterSpacing: 0.38),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.paddingHorizontal),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding24),
                      child: CardWidget(
                        title: "Паспорт",
                        description: "Добавить",
                        iconPath: "assets/images/ic_documents.svg",
                        backgroundColor: Constants.themeColor,
                        onPressed: () async{
                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDocumentPage(documentTag: "0")));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding16),
                      child: CardWidget(
                        title: "Загранпаспорт",
                        description: "Добавить",
                        iconPath: "assets/images/ic_documents.svg",
                        backgroundColor: Constants.themeColor,
                        onPressed: () async{
                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDocumentPage(documentTag: "1")));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding16),
                      child: CardWidget(
                        title: "СНИЛС",
                        description: "Добавить",
                        iconPath: "assets/images/ic_documents.svg",
                        backgroundColor: Constants.themeColor,
                        onPressed: () async{
                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDocumentPage(documentTag: "2")));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding16),
                      child: CardWidget(
                        title: "Водительские права",
                        description: "Добавить",
                        iconPath: "assets/images/ic_documents.svg",
                        backgroundColor: Constants.themeColor,
                        onPressed: () async{
                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDocumentPage(documentTag: "3")));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.padding16, bottom: SizeConfig.padding8*4),
                      child: CardWidget(
                        title: "ПТС",
                        description: "Добавить",
                        iconPath: "assets/images/ic_documents.svg",
                        backgroundColor: Constants.themeColor,
                        onPressed: () async{
                          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDocumentPage(documentTag: "3")));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
