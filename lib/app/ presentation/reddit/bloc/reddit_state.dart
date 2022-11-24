part of 'reddit_bloc.dart';

@immutable
abstract class RedditState {}

class RedditInitial extends RedditState {}

class RedditLoadingState extends RedditState {}

class RedditLoadedState extends RedditState {
  final List<RedditBodyChildren?>? model;

  RedditLoadedState({this.model});
}

class RedditFailedState extends RedditState {
  final String? message;
  RedditFailedState({this.message});
}
