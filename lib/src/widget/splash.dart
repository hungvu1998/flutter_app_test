import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    new Future.delayed(
         Duration(seconds: 3),
            (){

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(),
              ),
              );
            },);
     // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child:  Icon(
            FontAwesomeIcons.facebookMessenger,
            size: 250,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}


