import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reddit_bloc.dart';

class RedditHomeView extends StatelessWidget {
  const RedditHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final redditBloc = BlocProvider.of<RedditBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
