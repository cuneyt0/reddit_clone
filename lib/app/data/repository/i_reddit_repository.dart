import 'package:case_reddit/app/data/model/reddit_model.dart';

abstract class IRedditRepository {
  Future<List<RedditChildren?>?> getPosts({int? count});
}
