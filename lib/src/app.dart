import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/widget/login.dart';
import 'package:flutter_app_test/src/widget/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setValue();
  }

  void setValue() async {
    final prefs = await SharedPreferences.getInstance();
    int launchCount = prefs.getInt('counter') ?? 0;
    prefs.setInt('counter', launchCount + 1);
    if (launchCount == 0) {
      Navigator.of(context).pushReplacement( MaterialPageRoute(
        builder: (context) {
          return SplashScreen();
        },));
    } else {
      Navigator.of(context).pushReplacement( MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

