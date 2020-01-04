import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> noInternetDialog(context){
  return showDialog(
      context: context,
      builder: (BuildContext buildContext){
        return AlertDialog(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.network_check,
                  size: 30,
                  color: Colors.red,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Internet Status!',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                    ),
                  ),
                ),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[

                  Padding(
                    padding:  EdgeInsets.only(right: 0),
                    child: Text(
                      'You are Not Connected to the Internet.',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        height: 1.3,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
    }
  );
}