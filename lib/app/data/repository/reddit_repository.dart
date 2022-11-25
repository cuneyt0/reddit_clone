import 'package:case_reddit/app/constant/app_string.dart';
import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:case_reddit/app/data/repository/i_reddit_repository.dart';
import 'package:case_reddit/app/data/service/i_reddit_service.dart';

class RedditRepository extends IRedditRepository {
  final IRedditService? iRedditService;

  RedditRepository({this.iRedditService});

  @override
  Future<List<RedditChildren?>?> getPosts({int? count}) async {
    try {
      final result = await iRedditService?.getPosts(count: count);
      return result;
    } catch (e) {
      throw Exception(repositoryErrorMessage);
    }
  }
}
