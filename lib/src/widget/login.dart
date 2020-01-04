import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/widget/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
        color: Colors.white,
        constraints: BoxConstraints.expand(),
        child:Column(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.facebookMessenger,
              size: 150,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Welcome back!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xff333333)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Login to continue using myApp",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff333333)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200,right: 50,left: 50),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: RaisedButton(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Icon(
                          FontAwesomeIcons.facebookSquare,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                          "LOG IN WITH FACEBOOK",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      )

                    ],
                  ), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  onPressed: ()=> _onLoginClick(0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30,right: 50,left: 50),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: RaisedButton(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: Icon(
                          FontAwesomeIcons.google,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "LOG IN WITH GMAIL",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                  onPressed: ()=> _onLoginClick(1),
                ),
              ),
            ),
          ],
        )

      ),
    );
  }

  void _onLoginClick(int type){
    switch(type){
      case 0:{
        //facebook
        Navigator.of(context).pushReplacement( MaterialPageRoute(
          builder: (context) {
            return HomeMess();
          },));
        break;
      }
      case 1:{
        //gmail
        Navigator.of(context).pushReplacement( MaterialPageRoute(
          builder: (context) {
            return HomeMess();
          },));
        break;
      }
    }
  }
}
