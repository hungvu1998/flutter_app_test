class UserModel{
  String id;
  String imageAvatarUrl;
  String name;
  List<String> idChat;
  List<String>listFriend;
  bool isActive;

  UserModel({this.id, this.imageAvatarUrl, this.name,this.idChat,this.isActive,this.listFriend});
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'imageAvatarUrl': imageAvatarUrl,
        'name':name,
        'idChat':idChat,
        'isActive':isActive
      };
}