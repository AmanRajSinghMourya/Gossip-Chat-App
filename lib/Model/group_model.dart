import 'package:gossip/Model/user_model.dart';

class GroupModel {
  String? id;
  String? name;
  String? description;
  String? groupimage;
  List<UserModel>? members;
  String? createdAt;
  String? createdBy;
  String? lastmessage;
  String? status;
  String? lasttimestamp;
  String? lastmessageby;
  String? timestamp;

  GroupModel(
      {this.id,
      this.name,
      this.description,
      this.groupimage,
      this.members,
      this.createdAt,
      this.createdBy,
      this.lastmessage,
      this.status,
      this.lasttimestamp,
      this.lastmessageby,
      this.timestamp});

  GroupModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["groupimage"] is String) {
      groupimage = json["groupimage"];
    }
    if (json["members"] is Map) {
      members = json["members"] ?? [];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["createdBy"] is String) {
      createdBy = json["createdBy"];
    }
    if (json["lastmessage"] is String) {
      lastmessage = json["lastmessage"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["lasttimestamp"] is String) {
      lasttimestamp = json["lasttimestamp"];
    }
    if (json["lastmessageby"] is String) {
      lastmessageby = json["lastmessageby"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["groupimage"] = groupimage;
    if (members != null) {
      _data["members"] = members;
    }
    _data["createdAt"] = createdAt;
    _data["createdBy"] = createdBy;
    _data["lastmessage"] = lastmessage;
    _data["status"] = status;
    _data["lasttimestamp"] = lasttimestamp;
    _data["lastmessageby"] = lastmessageby;
    _data["timestamp"] = timestamp;
    return _data;
  }
}
