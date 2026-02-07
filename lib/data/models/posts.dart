class Posts {
  Data? data;

  Posts({this.data});

  Posts.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<Post>? posts;

  Data({this.posts});

  Data.fromJson(Map<String, dynamic> json) {
    posts = json["posts"] == null
        ? null
        : (json["posts"] as List).map((e) => Post.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (posts != null) {
      _data["posts"] = posts?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Post {
  String? username;
  String? fullName;
  String? profilePicUrl;
  String? caption;
  int? likeCount;
  int? commentCount;
  ImageVersion? imageVersion;
  VideoVersion? videoVersion;
  bool isVideoPlaying = false;

  Post(
      {this.username,
      this.fullName,
      this.profilePicUrl,
      this.caption,
      this.likeCount,
      this.commentCount,
      this.imageVersion,
      this.videoVersion});

  Post.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    fullName = json["full_name"];
    profilePicUrl = json["profile_pic_url"];
    caption = json["caption"];
    likeCount = json["like_count"];
    commentCount = json["comment_count"];
    imageVersion = json["image_version"] == null
        ? null
        : ImageVersion.fromJson(json["image_version"]);
    videoVersion = json["video_version"] == null
        ? null
        : VideoVersion.fromJson(json["video_version"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["username"] = username;
    _data["full_name"] = fullName;
    _data["profile_pic_url"] = profilePicUrl;
    _data["caption"] = caption;
    _data["like_count"] = likeCount;
    _data["comment_count"] = commentCount;
    if (imageVersion != null) {
      _data["image_version"] = imageVersion?.toJson();
    }
    if (videoVersion != null) {
      _data["video_version"] = videoVersion?.toJson();
    }
    return _data;
  }
}

class VideoVersion {
  String? url;
  int? width;
  int? height;

  VideoVersion({this.url, this.width, this.height});

  VideoVersion.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["width"] = width;
    _data["height"] = height;
    return _data;
  }
}

class ImageVersion {
  String? url;
  int? width;
  int? height;

  ImageVersion({this.url, this.width, this.height});

  ImageVersion.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    width = json["width"];
    height = json["height"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["url"] = url;
    _data["width"] = width;
    _data["height"] = height;
    return _data;
  }
}
