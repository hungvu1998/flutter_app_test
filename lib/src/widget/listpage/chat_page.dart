import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/model/user_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'itemchat_chatpage.dart';

class ChatPage extends StatefulWidget {
  final UserModel datasUser;
  const ChatPage({Key key, this.datasUser}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin{

  final Firestore nodeRoot = Firestore.instance;
  bool _isVisibility=true;
  final FocusNode focusNode = new FocusNode();


  Animation animation,transformationAnim;
  AnimationController animationController;
  @override
  void initState() {
    focusNode.addListener(onFocusChange);
    animationController=AnimationController(duration: Duration(seconds:1),vsync: this);
    animation=Tween(begin: 0,end: 0).animate(
      CurvedAnimation(
        parent: animationController,curve: Curves.easeInCubic
      )
    );
    super.initState();
  }
  void onFocusChange() {
    if (focusNode.hasFocus) {
    //  animationController.forward();
//      setState(() {
//        _isVisibility=!_isVisibility;
//      });

    }
  }
  var width;

  @override
  Widget build(BuildContext context) {
     width=MediaQuery.of(context).size.width;
//    return AnimatedBuilder(
//      animation: animationController,
//      builder: (context,child){
////        return Column(
////          children: <Widget>[
////            _buildAppBar(widget.datasUser.imageAvatarUrl),
////            Container(
////
////              child: Column(
////                  children: <Widget>[
////                    Expanded(
////                      child: ListView.builder(
////                        itemCount: widget.datasUser.idChat.length + 2,
////                        itemBuilder: (context,index){
////                          if(index == 0){
////                            //search
////                            return _buildSearchBar();
////                          }
////                          else if(index == 1){
////                            //story
////                            return _buildStoriesList();
////                          }
////                          else {
////                            return StreamBuilder(
////                              stream: nodeRoot
////                                  .collection('chats/'+widget.datasUser.idChat[index -2].toString()+'/message')
////                                  .orderBy("timestamp",descending: true)
////                                  .snapshots(),
////                              builder: (context,snapshotChatItem){
////                                if(!snapshotChatItem.hasData){
////                                  return  Container();
////                                }
////                                else{
////                                  return ConversationItem(
////                                      listDataChat:snapshotChatItem.data.documents
////                                  );
////                                }
////                              },
////                            );
////                          }
////
////                        },
////                      ),
////                    )
////                  ],
////                ),
////            ),
////          ],
////        );
////        return Container(
////          color:Colors.white,
////          child: Column(
////            children: <Widget>[
////              _buildAppBar(widget.datasUser.imageAvatarUrl),
////              Container(
////               // transform: Matrix4.translationValues(0.0, 0, 0),
////                child: Expanded(
////                  child: ListView.builder(
////                    itemCount: widget.datasUser.idChat.length + 2,
////                    itemBuilder: (context,index){
////                      if(index == 0){
////                        //search
////                        return _buildSearchBar();
////                      }
////                      else if(index == 1){
////                        //story
////                        return _buildStoriesList();
////                      }
////                      else {
////                        return StreamBuilder(
////                          stream: nodeRoot
////                              .collection('chats/'+widget.datasUser.idChat[index -2].toString()+'/message')
////                              .orderBy("timestamp",descending: true)
////                              .snapshots(),
////                          builder: (context,snapshotChatItem){
////                            if(!snapshotChatItem.hasData){
////                              return  Container();
////                            }
////                            else{
////                              return ConversationItem(
////                                  listDataChat:snapshotChatItem.data.documents
////                              );
////                            }
////                          },
////                        );
////                      }
////
////                    },
////                  ),
////                ),
////              )
////            ],
////          ),
////        );
//
//      },
//    );
  return Container(
    color:Colors.white,
    child: Column(
      children: <Widget>[
        _buildAppBar(widget.datasUser.imageAvatarUrl),
        Expanded(
          child: ListView.builder(
            itemCount: widget.datasUser.idChat.length + 2,
            itemBuilder: (context,index){
              if(index == 0){
                //search
                return _buildSearchBar();
              }
              else if(index == 1){
                //story
                return _buildStoriesList();
              }
              else {
                return StreamBuilder(
                  stream: nodeRoot
                      .collection('chats/'+widget.datasUser.idChat[index -2].toString()+'/message')
                      .orderBy("timestamp",descending: true)
                      .snapshots(),
                  builder: (context,snapshotChatItem){
                    if(!snapshotChatItem.hasData){
                      return  Container();
                    }
                    else{
                      return ConversationItem(
                          listDataChat:snapshotChatItem.data.documents
                      );
                    }
                  },
                );
              }

            },
          ),
        )
      ],
    ),
  );
  }

  _buildAppBar(String imgUrl){
    return Container(

      child: Padding(
        padding:EdgeInsets.only(
          top:40, left:16,right: 16,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: (){},
                    child: ClipOval(
                      child: Image.network(
                        imgUrl,
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:24,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(
                        FontAwesomeIcons.camera,
                        size: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(
                        FontAwesomeIcons.pen,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
      )
    ) ;
  }
  _buildSearchBar(){
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0,top: 20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 7,
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: <Widget>[
                  Container(width: 10,),
                  Icon(Icons.search),
                  Container(width: 8,),
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search'
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _buildStoriesList(){
    return Container();
  }

}





