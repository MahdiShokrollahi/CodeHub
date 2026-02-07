class Stories {
  List<StoryModel>? stories;

  Stories({this.stories});

  Stories.fromJson(Map<String, dynamic> json) {
    stories = json["stories"] == null
        ? null
        : (json["stories"] as List).map((e) => StoryModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (stories != null) {
      _data["stories"] = stories?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class StoryModel {
  String? username;
  String? profilePicUrl;
  List<Media>? medias;
  bool? isCompleted;

  StoryModel(
      {this.username,
      this.profilePicUrl,
      this.medias,
      this.isCompleted = false});

  StoryModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    profilePicUrl = json["profile_pic_url"];
    medias = json["medias"] == null
        ? null
        : (json["medias"] as List).map((e) => Media.fromJson(e)).toList();
    isCompleted = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["username"] = username;
    _data["profile_pic_url"] = profilePicUrl;
    if (medias != null) {
      _data["medias"] = medias?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Media {
  String? type;
  String? url;

  Media({this.type, this.url});

  Media.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["url"] = url;
    return _data;
  }
}
