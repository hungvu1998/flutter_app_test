import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_test/src/model/user_model.dart';

final homeBloc = HomeBloc();

class HomeBloc {
  var nodeRoot = Firestore.instance;

  var _userController = StreamController<UserModel>.broadcast();
  Stream get userStream => _userController.stream;
  UserModel userModel;
  Future<void> getUserInfo(String _idUser) async{
    await nodeRoot.collection('users').where("id", isEqualTo: _idUser ).getDocuments().then((value){
      userModel=new UserModel(
          id: value.documents[0]['id'],
          name: value.documents[0]['name'],
          listFriend: value.documents[0]['listFriend'].cast<String>(),
          idChat: value.documents[0]['idChat'].cast<String>(),
          isActive: value.documents[0]['isActive'],
          imageAvatarUrl:  value.documents[0]['imageAvatarUrl']);
      _userController.add(userModel);
    });

  }

  void dispose(){
    _userController?.close();
  }

}