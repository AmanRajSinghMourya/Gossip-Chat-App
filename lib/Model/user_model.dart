class UserModel {
  String? name;
  String? id;
  String? email;
  String? image;
  String? phone;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  UserModel({
    this.name,
    this.id,
    this.email,
    this.image,
    this.phone,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
    email = json["email"];
    image = json["image"];
    phone = json["phone"];
    about = json["about"];
    createdAt = json["createdAt"];
    lastOnlineStatus = json["lastOnlineStatus"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["id"] = id;
    _data["email"] = email;
    _data["image"] = image;
    _data["phone"] = phone;
    _data["about"] = about;
    _data["createdAt"] = createdAt;
    _data["lastOnlineStatus"] = lastOnlineStatus;
    return _data;
  }
}
