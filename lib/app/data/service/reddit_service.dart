import 'dart:io';

import 'package:case_reddit/app/constant/app_string.dart';
import 'package:case_reddit/app/constant/base_url_constant.dart';
import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:case_reddit/app/data/service/i_reddit_service.dart';
import 'package:dio/dio.dart';

class RedditService extends IRedditService {
  final Dio? dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  @override
  Future<List<RedditChildren?>?> getPosts({int? count}) async {
    try {
      final response = await dio?.get(path, queryParameters: {'count': count});
      if (response?.statusCode == HttpStatus.ok) {
        if (response?.data['data']['children'] is List) {
          List<RedditChildren>? list =
              (response?.data['data']['children'] as List)
                  .map((e) => RedditChildren.fromJson(e))
                  .toList();
          return list;
        }
        return [];
      } else if (response?.statusCode == HttpStatus.badRequest) {
        throw Exception(badRequest);
      } else {
        throw Exception(serviceErrorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
