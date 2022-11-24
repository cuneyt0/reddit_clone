import 'package:case_reddit/app/data/model/reddit_model.dart';

abstract class IRedditService {
  final String path = IRedditServicePath.get.rawValue;

  Future<List<RedditBodyChildren?>?> getPosts({int? count});
}

enum IRedditServicePath { get }

extension ILoginSericePathExtension on IRedditServicePath {
  String get rawValue {
    switch (this) {
      case IRedditServicePath.get:
        return '/top.json';
    }
  }
}
