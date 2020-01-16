import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:oktoast/oktoast.dart';

import '../../routes/paths.dart';
import '../../routes/paths.dart';

class Agreement extends StatefulWidget {
  Agreement({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AgreementState createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {


  Locale _currentLang;

  @override
  void initState() {
    super.initState();

    new Future.delayed(Duration.zero, () async {
      setState(() {
        _currentLang = FlutterI18n.currentLocale(context);
      });
    });
  }

  captchaclick() {

  }

 loginclick(){
      Navigator.pushNamed(context, log_in);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color.fromRGBO(36, 37, 67, 1)),
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, register);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(36, 37, 67, 1),
          ),
        ),
      ),
      body: Container(
        ),
      );
  }
}
