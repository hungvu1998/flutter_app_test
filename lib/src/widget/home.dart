

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/bloc/auth_bloc.dart';
import 'package:flutter_app_test/src/bloc/home_bloc.dart';
import 'package:flutter_app_test/src/model/user_model.dart';
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
        stream: nodeRoot.collection('users').where("id", isEqualTo: authBloc.userCurrent).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Scaffold(
                body: Center(child: CircularProgressIndicator())
            ) ;
          }
          else{
            var userModel =  new UserModel(
                id: snapshot.data.documents[0]['id'],
                name: snapshot.data.documents[0]['name'],
                listFriend: snapshot.data.documents[0]['listFriend'].cast<String>(),
                idChat: snapshot.data.documents[0]['idChat'].cast<String>(),
                isActive: snapshot.data.documents[0]['isActive'],
                imageAvatarUrl: snapshot.data.documents[0]['imageAvatarUrl']);
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                body: Container(
                  child: TabBarView(
                    children: <Widget>[
                      ChatPage(datasUser: userModel,),
                      ChatPage(datasUser: userModel,),
                      ChatPage(datasUser: userModel,),
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
