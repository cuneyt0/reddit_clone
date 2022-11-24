import 'package:case_reddit/app/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/ presentation/reddit/bloc/reddit_bloc.dart';
import 'app/ presentation/reddit/view/reddit_home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIT();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<RedditBloc>(
        create: (_) => getIt.get<RedditBloc>(),
        child: const RedditHomeView(),
      ),
    );
  }
}
