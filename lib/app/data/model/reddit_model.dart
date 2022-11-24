class RedditChildren {
  final String? kind;
  final RedditChildrenDataModel? data;

  RedditChildren({this.kind, this.data});

  factory RedditChildren.fromJson(Map<String, dynamic> json) => RedditChildren(
      kind: json['kind'],
      data: json['data'] != null
          ? RedditChildrenDataModel.fromJson(json['data'])
          : null);
  Map<String, dynamic> toJson() => {'kind': kind, 'data': data};
}

class RedditChildrenDataModel {
  final bool? approved_at_utc;
  final String? subreddit;
  final String? selftext;
  final String? author_fullname;
  final bool? saved;
  final String? title;
  final String? thumbnail;
  final int? thumbnail_height;
  final int? thumbnail_width;
  final List<RedditAllAwardingModel?>? all_awardings;

  RedditChildrenDataModel(
      {this.approved_at_utc,
      this.subreddit,
      this.selftext,
      this.author_fullname,
      this.saved,
      this.title,
      this.thumbnail,
      this.thumbnail_height,
      this.thumbnail_width,
      this.all_awardings});

  factory RedditChildrenDataModel.fromJson(Map<String, dynamic> json) =>
      RedditChildrenDataModel(
        approved_at_utc: json['approved_at_utc'],
        subreddit: json['subreddit'],
        selftext: json['selftext'],
        author_fullname: json['author_fullname'],
        saved: json['saved'],
        title: json['title'],
        thumbnail: json['thumbnail'],
        all_awardings: json['all_awardings'] != null
            ? json['all_awardings'].forEach((v) {
                json['all_awardings']!.add(RedditAllAwardingModel.fromJson(v));
              })
            : null,
      );
}

class RedditAllAwardingModel {
  final String? description;

  RedditAllAwardingModel({this.description});

  factory RedditAllAwardingModel.fromJson(Map<String, dynamic> json) =>
      RedditAllAwardingModel(description: json['description']);

  Map<String, dynamic> toJson() => {'description': description};
}
