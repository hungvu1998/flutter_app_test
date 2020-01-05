import 'package:flutter/material.dart';
import 'package:flutter_app_test/src/bloc/home_bloc.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      constraints: BoxConstraints.expand(),
      child: Column(
        children: <Widget>[
          _buildAppBar(homeBloc.userModel.imageAvatarUrl),
          ListView.builder(
            itemCount: homeBloc.userModel.idChat.length + 2,
            itemBuilder: (context,index){
              if(index == 0){
                //search
                return __buildSearchBar();
              }
              else if(index == 1){
                //story
                return Container();
              }
              else {
                return Container();
              }

            },
          )
        ],
      )
    );
  }

  _buildAppBar(String imgUrl){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ],
    );
  }
  __buildSearchBar(){
    return Row(
      children: <Widget>[
        Container(
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search'
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}





