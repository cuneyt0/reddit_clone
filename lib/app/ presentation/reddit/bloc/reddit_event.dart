part of 'reddit_bloc.dart';

@immutable
abstract class RedditEvent {}

class getPostsEvent extends RedditEvent {
  final int? count;

  getPostsEvent({this.count});
}

class getRefreshPostsEvent extends RedditEvent {
  final int? count;

  getRefreshPostsEvent({this.count});
}
