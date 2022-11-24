import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:case_reddit/app/data/service/i_reddit_service.dart';
import 'package:case_reddit/app/repository/i_reddit_repository.dart';

class RedditRepository extends IRedditRepository {
  final IRedditService? iRedditService;

  RedditRepository({this.iRedditService});

  @override
  Future<List<RedditBodyChildren?>?> getPosts({int? count}) async {
    try {
      final result = await iRedditService?.getPosts(count: count);
      return result;
    } catch (e) {
      throw Exception("Repo Katmanında Hata Gerçekleşti.");
    }
  }
}
