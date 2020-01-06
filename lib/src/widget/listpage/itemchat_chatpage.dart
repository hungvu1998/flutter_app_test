import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/bloc/auth_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ConversationItem extends StatefulWidget {
  final List<DocumentSnapshot> listDataChat;

  ConversationItem({Key key, this.listDataChat}) : super(key: key);
  @override
  _ConversationItemState createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {

  final Firestore nodeRoot = Firestore.instance;

  @override
  void initState() {
    print(widget.listDataChat[0]["type"]);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildFriendChat(),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SlideAction(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SlideAction(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.phone,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: SlideAction(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.videocam,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
        ],
        secondaryActions: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SlideAction(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: SlideAction(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SlideAction(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.restore_from_trash,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }


  _buildFriendChat()  {
    var img;
    var name;
    var timestamp;
    var check;
    var active;
    String friendId = _getIDfriend();
    return StreamBuilder(
      stream: nodeRoot.collection('users')
          .where("id", isEqualTo: friendId)
          .snapshots(),
      builder: (context,snapshotFriend){
        if(snapshotFriend.hasData){
          img=snapshotFriend.data.documents[0]['imageAvatarUrl'];
          name=snapshotFriend.data.documents[0]['name'];
          timestamp=widget.listDataChat[0]["timestamp"];
          check=widget.listDataChat[0]["check"];
          active=snapshotFriend.data.documents[0]['isActive'];
          return Row(
            children: <Widget>[
              //Ảnh user và trạng thái hoạt động
              Stack(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image:NetworkImage(snapshotFriend.data.documents[0]['imageAvatarUrl']),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Visibility(
                    visible: snapshotFriend.data.documents[0]['isActive'],
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color:Colors.green
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
              //Phần giữa
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Tên user friend
                      Text(
                          snapshotFriend.data.documents[0]['name'],
                          maxLines: 1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 2),
                      Container(
                        child: Row(
                          children: <Widget>[
                            _buildLatestMessage()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ) ;
        }else if(img!=null){
          return  Row(
            children: <Widget>[
              //Ảnh user và trạng thái hoạt động
              Stack(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image:NetworkImage(img),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Visibility(
                    visible: active,
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color:Colors.green
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
              //Phần giữa
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Tên user friend
                      Text(
                         name,
                          maxLines: 1,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 2),
                      Container(
                        child: Row(
                          children: <Widget>[
                            _buildLatestMessage()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          );
        }
        else
          return Container();

      },

    );
  }
  _buildLatestMessage(){
    bool isThatYou= widget.listDataChat[0]["idFrom"]==authBloc.userCurrent;
    return Container(
      constraints: BoxConstraints(maxWidth: 100),
      child: widget.listDataChat[0]["type"]==0
      ?Text(
        isThatYou?"Bạn: "+widget.listDataChat[0]["content"] : widget.listDataChat[0]["content"],
        style: TextStyle(
          color:  widget.listDataChat[0]["check"]? Colors.black : Colors.grey.shade700,
          fontSize:16,
          fontWeight: widget.listDataChat[0]["check"]? FontWeight.bold : null,
        ),
      )
      : widget.listDataChat[0]["type"]==1
      ? Text(
          isThatYou ? "Bạn: [Image]" : "[Image]"
      ):
      Text(
          isThatYou ? "Bạn: Sticker":"Sticker"
      ) ,
    );

  }
  String _getIDfriend(){
    String idFriend;
    for(var item in widget.listDataChat){
      if(item.data["idTo"].toString()!= authBloc.userCurrent){
        idFriend= item.data["idTo"].toString();
        break;
      }
      if(item.data["idFrom"].toString()!=authBloc.userCurrent){
        idFriend= item.data["idFrom"].toString();
        break;
      }
    }
    return idFriend;
  }
}
