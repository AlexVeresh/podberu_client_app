import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podberu_client_app/sizeConfig.dart';

import 'loginAndRegistrationWidgets.dart';

class FirstLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FirstLoginAndRegistrationWidget(screenType: "login");
  }
}
