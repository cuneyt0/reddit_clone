import 'package:case_reddit/app/%20presentation/reddit/bloc/reddit_bloc.dart';
import 'package:case_reddit/app/data/service/i_reddit_service.dart';
import 'package:case_reddit/app/data/service/reddit_service.dart';
import 'package:case_reddit/app/repository/i_reddit_repository.dart';
import 'package:case_reddit/app/repository/reddit_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupServices();
  setupRepository();
  setupBloc();
}

void setupBloc() {
  getIt.registerLazySingleton<RedditBloc>(
      () => RedditBloc(redditRepository: getIt()));
}

void setupServices() {
  getIt.registerLazySingleton<IRedditService>(RedditService.new);
}

void setupRepository() {
  getIt.registerLazySingleton<IRedditRepository>(
      () => RedditRepository(iRedditService: getIt()));
}
