

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/bloc/auth_bloc.dart';
import 'package:flutter_app_test/src/bloc/home_bloc.dart';
import 'package:flutter_app_test/src/widget/listpage/chat_page.dart';

import 'dialog.dart';

class HomeMess extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeMess> {
  var connectivityStatus = 'Unknown';
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubs;
  @override
  void initState() {
    connectivitySubs =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          connectivityStatus = result.toString();
          if (result == ConnectivityResult.none) {
            noInternetDialog(context);
          }
        });
    homeBloc.getUserInfo(authBloc.userCurrent);
    super.initState();
  }

  var nodeRoot = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: homeBloc.userStream,
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                body: Container(
                  child: TabBarView(
                    children: <Widget>[
                      ChatPage(),
                      ChatPage(),
                      ChatPage(),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      )
    );
  }
  @override
  void dispose() {
    connectivitySubs.cancel();
    super.dispose();
  }
}
