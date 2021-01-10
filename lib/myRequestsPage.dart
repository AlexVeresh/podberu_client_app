import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/Constants.dart';
import 'package:podberu_client_app/widgets/buttonWidget.dart';
import 'package:podberu_client_app/widgets/cardWidget.dart';
import 'package:podberu_client_app/widgets/profileBar.dart';


class MyRequestsPage extends StatefulWidget {
  List requests;
  MyRequestsPage({this.requests});

  @override
  _MyRequestsPageState createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  @override
  void initState() {
    super.initState();
  }


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
                  "Мои заявки",
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.38),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: widget.requests == null || widget.requests.isEmpty
                    ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height/4.4,
                          bottom: MediaQuery.of(context).size.height/4.7,
                      ),
                      child: Text(
                            "Сейчас у вас нет" + "\n" + "заявок",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: -0.24),
                          ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 24.0),
                            child: CardWidget(
                              title: "Дебетовая карта",
                              description: "24.12.2020",
                              iconPath: "assets/images/ic_cards.svg",
                              backgroundColor: Constants.themeColor,
                              onPressed: (){
                              },
                            ),
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, right: 44, left: 44, bottom: 24),
                child: ButtonWidget(
                  title: "Новая заявка",
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
