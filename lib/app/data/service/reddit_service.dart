import 'dart:io';

import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:case_reddit/app/data/service/i_reddit_service.dart';
import 'package:dio/dio.dart';

class RedditService extends IRedditService {
  final Dio? dio = Dio();

  @override
  Future<RedditModel?>? getPosts({int? count}) async {
    try {
      final response = await dio?.get(path, queryParameters: {'count': count});
      if (response?.statusCode == HttpStatus.ok) {
        print(response?.data);
        return RedditModel.fromJson(response?.data);
      } else {
        throw Exception("Veri Getirilemedi");
      }
    } catch (e) {
      if ((e as DioError).response != null) {
        return e.response!.data;
      } else {
        throw Exception(e.error);
      }
    }
  }
}
