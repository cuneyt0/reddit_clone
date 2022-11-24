import 'package:bloc/bloc.dart';
import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:case_reddit/app/repository/i_reddit_repository.dart';
import 'package:meta/meta.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  final IRedditRepository? redditRepository;

  RedditBloc({this.redditRepository}) : super(RedditInitial()) {
    on<RedditEvent>(
      (event, emit) async {
        if (event is getPostsEvent) {
          emit(RedditLoadingState());

          try {
            final response =
                await redditRepository?.getPosts(count: event.count);

            emit(RedditLoadedState(model: response));
          } catch (e) {
            emit(RedditFailedState());
          }
        }
      },
    );
  }
}
