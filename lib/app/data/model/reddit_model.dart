class RedditModel {
  String? kind;
  RedditBodyData? data;

  RedditModel({this.kind, this.data});

  RedditModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? RedditBodyData.fromJson(json['data']) : null;
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

class RedditBodyData {
  int? dist;
  String? modhash;
  String? geoFilter;
  List<RedditBodyChildren>? children;
  String? before;

  RedditBodyData(
      {this.dist, this.modhash, this.geoFilter, this.children, this.before});

  RedditBodyData.fromJson(Map<String, dynamic> json) {
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    if (json['children'] != null) {
      children = <RedditBodyChildren>[];
      json['children'].forEach((v) {
        children!.add(RedditBodyChildren.fromJson(v));
      });
    }
    before = json['before'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['dist'] = dist;
    data['modhash'] = modhash;
    data['geo_filter'] = geoFilter;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    data['before'] = before;
    return data;
  }
}

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
  RedditAllAwardingModel? all_awardings;

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
    thumbnail = json['thumbnail'];
    all_awardings = json['all_awardings'] != null
        ? RedditAllAwardingModel.fromJson(json['all_awardings'])
        : null;
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

    if (all_awardings != null) {
      data['all_awardings'] = all_awardings!.toJson();
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
