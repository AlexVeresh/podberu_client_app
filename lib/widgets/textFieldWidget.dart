import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:podberu_client_app/sizeConfig.dart';

import '../Constants.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  int inputTypeCode;

  TextFieldWidget({this.hintText, this.inputTypeCode});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(hintText: hintText);
  }
}

class DefaultTextField extends StatefulWidget {
  String hintText;
  DefaultTextField({this.hintText});

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding16, vertical: SizeConfig.padding8/4),
      constraints: BoxConstraints(minWidth: double.infinity),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 1, color: Constants.themeColor)
      ),
      child:TextField(
              style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
              )
          ),
      );
  }
}



class ImageInputTextField extends StatefulWidget {
  @override
  _ImageInputTextFieldState createState() => _ImageInputTextFieldState();
}

class _ImageInputTextFieldState extends State<ImageInputTextField> {

  File _image;
  String _imageName;
  final picker = ImagePicker();
  final GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey<ExtendedImageEditorState>();


  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        List imagePath = _image.path.split('/');
        print(_image.path);
        _imageName = imagePath[imagePath.length-1];
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          onTap: () {
            getImage();
          },
          child: Container(
            constraints: BoxConstraints(minWidth: double.infinity),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(width: 1, color: Constants.themeColor)
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.padding15, bottom: SizeConfig.padding15, left: SizeConfig.padding16),
                  child: Text(
                    "Скан паспорта",
                    style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.padding16),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: SizeConfig.textSize24,
                  ),
                )
              ],
            ),
          ),
        ),
        _image != null
            ? InkWell(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                //     ExtendedImage(
                //       image: ExtendedFileImageProvider(_image),
                //       fit: BoxFit.contain,
                //       mode: ExtendedImageMode.editor,
                //       extendedImageEditorKey: editorKey,
                //       initEditorConfigHandler: (ExtendedImageState state) {
                //         return EditorConfig(
                //             maxScale: 8.0,
                //             cropRectPadding: EdgeInsets.all(20.0),
                //             hitTestSize: 20.0,
                //         );
                //       },
                //     )
                //   )
                // );
                print(editorKey.currentState);
                },
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.padding8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                constraints: BoxConstraints(minWidth: double.infinity),
                padding: EdgeInsets.symmetric(vertical: SizeConfig.padding8, horizontal: SizeConfig.padding8),
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding8),
                        child: Text(
                          _imageName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          _image = null;
                        });
                      },
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white
                      ),
                    )
                  ],
                )
              ),
            )
            : Container()
      ],
    );
  }
}



class PhoneNumberTextField extends StatefulWidget {
  @override
  _PhoneNumberTextFieldState createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 1, color: Constants.themeColor)
      ),
      child: Row(
        children: [
          CountryCodePicker(
            padding: EdgeInsets.only(top: SizeConfig.padding15, bottom: SizeConfig.padding15, left: SizeConfig.padding16),
            builder: (CountryCode c){
              return Padding(
                padding: EdgeInsets.only(top: SizeConfig.padding15, bottom: SizeConfig.padding15, left: SizeConfig.padding16, right: SizeConfig.padding6),
                child: Text(
                    c.dialCode,
                    style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24)
                ),
              );
            },
            favorite: [
              'RU', 'US', 'UA', 'GB'
            ],
            showFlag: false,
            showFlagDialog: true,
            initialSelection: '+7',
          ),
          Expanded(
            child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(color: Colors.white, fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //hintText: formattedNumber,
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.6), fontSize: SizeConfig.textSize15, fontWeight: FontWeight.w600, letterSpacing: -0.24),
                )
            ),
          ),
        ],
      ),
    );
  }
}

