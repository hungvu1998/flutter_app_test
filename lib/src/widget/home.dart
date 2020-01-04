

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          child: TabBarView(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    connectivitySubs.cancel();
    super.dispose();
  }
}
