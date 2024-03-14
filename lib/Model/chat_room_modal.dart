import 'package:gossip/Model/chat_model.dart';
import 'package:gossip/Model/user_model.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? reciever;
  List<ChatModel>? messages;
  int? unReadMessages;
  String? lastMessage;
  String? lastTimeStamp;
  String? timeStamp;

  ChatRoomModel(
      {this.id,
      this.sender,
      this.reciever,
      this.messages,
      this.unReadMessages,
      this.lastMessage,
      this.lastTimeStamp,
      this.timeStamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sender = json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    reciever =
        json["reciever"] == null ? null : UserModel.fromJson(json["reciever"]);
    messages = json["messages"] ?? [];
    unReadMessages = (json["unReadMessages"] as num).toInt();
    lastMessage = json["lastMessage"];
    lastTimeStamp = json["lastTimeStamp"];
    timeStamp = json["timeStamp"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if (sender != null) {
      _data["sender"] = sender?.toJson();
    }
    if (reciever != null) {
      _data["reciever"] = reciever?.toJson();
    }
    if (messages != null) {
      _data["messages"] = messages;
    }
    _data["unReadMessages"] = unReadMessages;
    _data["lastMessage"] = lastMessage;
    _data["lastTimeStamp"] = lastTimeStamp;
    _data["timeStamp"] = timeStamp;
    return _data;
  }
}
