import 'package:case_reddit/app/get_it/get_it.dart';
import 'package:flutter/material.dart';

import '../bloc/reddit_bloc.dart';

class RedditHomeView extends StatelessWidget {
  const RedditHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final RedditBloc redditBloc = getIt.get<RedditBloc>();
    //final redditBloc = getIt.get<BlocProvider.of<RedditBloc>(context)>();
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          redditBloc.add(getPostsEvent(count: 20));
        },
      ),
    );
  }
}
