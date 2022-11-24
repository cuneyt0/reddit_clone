class RedditBodyChildren {
  String? kind;
  RedditChildrenDataModel? data;
  RedditBodyChildren({this.kind, this.data});

  RedditBodyChildren.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null
        ? RedditChildrenDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RedditChildrenDataModel {
  bool? approved_at_utc;
  String? subreddit;
  String? selftext;
  String? author_fullname;
  bool? saved;
  int? gilded;
  String? title;
  String? thumbnail;
  int? thumbnail_height;
  int? thumbnail_width;
  List<RedditAllAwardingModel?>? all_awardings;

  RedditChildrenDataModel(
      {this.approved_at_utc,
      this.subreddit,
      this.selftext,
      this.author_fullname,
      this.saved,
      this.gilded,
      this.title,
      this.thumbnail,
      this.all_awardings});

  RedditChildrenDataModel.fromJson(Map<String, dynamic> json) {
    approved_at_utc = json['approved_at_utc'];
    subreddit = json['subreddit'];
    selftext = json['selftext'];
    author_fullname = json['author_fullname'];
    saved = json['saved'];
    gilded = json['gilded'];
    title = json['title'];
    thumbnail_height = json['thumbnail_height'];
    thumbnail_width = json['thumbnail_width'];
    thumbnail = json['thumbnail'];
    if (json['children'] != null) {
      all_awardings = <RedditAllAwardingModel>[];
      json['children'].forEach((v) {
        all_awardings!.add(RedditAllAwardingModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['approved_at_utc'] = approved_at_utc;
    data['subreddit'] = subreddit;
    data['selftext'] = selftext;
    data['author_fullname'] = author_fullname;
    data['saved'] = saved;
    data['gilded'] = gilded;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['thumbnail_height'] = thumbnail_height;
    data['thumbnail_width'] = thumbnail_width;
    if (all_awardings != null) {
      data['all_awardings'] = all_awardings!.map((v) => v?.toJson()).toList();
      return data;
    }
    return data;
  }
}

class RedditAllAwardingModel {
  String? description;
  RedditAllAwardingModel({this.description});
  RedditAllAwardingModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    return data;
  }
}
