import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double padding6;
  static double padding8;
  static double padding10;
  static double padding15;
  static double padding16;
  static double padding17;
  static double padding22;
  static double padding24;
  static double padding29;
  static double padding32;
  static double padding36;
  static double padding48;
  static double padding84;
  static double paddingHorizontal;
  static double iconSizeBig;
  static double iconSizeMid;
  static double iconSizeSm;
  static double profileImgSize;
  static double textSize24;
  static double textSize20;
  static double textSize17;
  static double textSize15;
  static double textSize13;


  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width/100;
    screenHeight = _mediaQueryData.size.height/100;
    padding6 = screenWidth*1.6;
    padding8 = screenWidth*2.12;
    padding10 = screenWidth*2.66;
    padding15 = screenWidth*4;
    padding16 = padding8*2;
    padding17 = screenWidth*4.53;
    padding22 = screenWidth*5.86;
    padding24 = padding8*3;
    padding29 = screenWidth*7.73;
    padding32 = padding8*4;
    padding36 = screenWidth*9.6;
    padding48 = padding8*6;
    padding84 = screenWidth*22.4;
    paddingHorizontal = screenWidth*11.7;
    textSize24 = padding8*3;
    textSize20 = padding10*2;
    textSize17 = screenWidth*4.5;
    textSize15 = padding15;
    textSize13 = screenWidth*3.5;
    profileImgSize = screenWidth*16;
    iconSizeMid = paddingHorizontal;
    iconSizeSm = screenWidth*7.5;
    iconSizeBig = screenWidth*12.8;
    print(_mediaQueryData.devicePixelRatio);
    print(_mediaQueryData.size.width);
    print(_mediaQueryData.size.height);
    print(padding8);
    print(padding16);

  }

}