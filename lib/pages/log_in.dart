import 'package:flutter/material.dart';

import '../routes/paths.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController iphone = TextEditingController();
  TextEditingController verification = TextEditingController();
  bool status = true;

  as(){
    verification.text = iphone.text;
    AlertDialog(actions: <Widget>[Expanded(child: Text('data'),)],);
    StepState(){
      AlertDialog(actions: <Widget>[Expanded(child: Text('data'),)],);
    }

    //Navigator.of(context).pushNamed('/shared_preferences');
    Navigator.popAndPushNamed(context, exmaple_list);
    /*Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SharedPreferencesDemo(),
      ),
    );*/
  }
  statusclick(){
    setState(() {
      status = !status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/bg@2x.png"),
                  fit: BoxFit.cover
              )
          ),
          // child:Container(
          // color: Color.fromRGBO(255, 113, 55, 1),
          // ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.74,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32))
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 23,top: 65,right: 23),
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        // child: Align(
                        // alignment: Alignment.topLeft,
                        child: Text(
                          'Welcome back！',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(36, 37, 67, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 28,bottom: 24),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromRGBO(247, 247, 255, 1),
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 60,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/mobile.png')
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: iphone,
                                decoration: InputDecoration(
                                  hintText: '手机号',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 24),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromRGBO(247, 247, 255, 1),
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 60,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/captcha.png')
                                  )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: verification,
                                obscureText: !status,
                                decoration: InputDecoration(
                                  hintText: status?'验证码':'密码',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                                width: status?123:0,
                                height: 52,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(52),
                                    color: Color.fromRGBO(255, 113, 56, 1),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(255, 113, 56, 1),
                                      )
                                    ]
                                ),
                                child:GestureDetector(
                                  onTap: as,
                                  child: Text(
                                    '发送验证码',
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.bold,
                                      height: 2,
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child:GestureDetector(
                                  onTap:statusclick,
                                  child: Text(
                                    status?'账号密码登录':'验证码登录',
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(255, 153, 107, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                              child: Text(
                                status?'':'忘记密码？',
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(168, 169, 180, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 90),
                        child: Text(
                          '其他登录方式',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(168, 169, 180, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}