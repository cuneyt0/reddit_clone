import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:dio/dio.dart';

abstract class IRedditService {
  final String path = IRedditServicePath.GET.rawValue;

  Future<RedditModel?>? getPosts({int? count});
}

enum IRedditServicePath { GET }

extension ILoginSericePathExtension on IRedditServicePath {
  String get rawValue {
    switch (this) {
      case IRedditServicePath.GET:
        return '/top.json';
    }
  }
}
