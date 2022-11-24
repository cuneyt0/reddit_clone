import 'package:case_reddit/app/constant/app_string.dart';
import 'package:case_reddit/app/data/model/reddit_model.dart';
import 'package:case_reddit/app/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reddit_bloc.dart';

class RedditHomeView extends StatelessWidget {
  const RedditHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final RedditBloc redditBloc = getIt.get<RedditBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text(homeAppbarTitle)),
      body: BlocBuilder(
        bloc: redditBloc,
        builder: ((context, state) {
          if (state is RedditInitial) {
            return _initialState();
          } else if (state is RedditLoadedState) {
            return _loadedState(state, redditBloc, context);
          } else if (state is RedditFailedState) {
            return _failedState(state);
          } else {
            return _loadingState();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => redditBloc.add(getPostsEvent(count: 20)),
        child: const Icon(Icons.electrical_services),
      ),
    );
  }

  Center _loadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Center _failedState(RedditFailedState state) =>
      Center(child: Text(state.message.toString()));

  RefreshIndicator _loadedState(
      RedditLoadedState state, RedditBloc redditBloc, BuildContext context) {
    {
      final response = state.model;
      return RefreshIndicator(
        onRefresh: () async => redditBloc.add(getRefreshPostsEvent(count: 20)),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  response?.length ?? 0,
                  (index) {
                    return _loadedStateBody(
                        response: response, state: state, index: index);
                  },
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  ListTile _loadedStateBody(
      {List<RedditBodyChildren?>? response,
      RedditLoadedState? state,
      int? index}) {
    return ListTile(
      title: _title(response: response, index: index),
      leading: _leadingImage(response: response, index: index, state: state),
      subtitle: _subtitleDescription(response: response, index: index),
    );
  }

  Text _title({List<RedditBodyChildren?>? response, int? index}) =>
      Text(response?[index ?? 0]?.data?.title ?? '');

  Text _subtitleDescription(
          {List<RedditBodyChildren?>? response, int? index}) =>
      Text(
          '${response?[index ?? 0]?.data?.all_awardings?[index ?? 0]?.description}');

  ClipRRect _leadingImage({
    List<RedditBodyChildren?>? response,
    int? index,
    RedditLoadedState? state,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          (response?[index ?? 0]?.data?.thumbnail != selfValue ||
                  response?[index ?? 0]?.data?.thumbnail != defaultValue)
              ? '${response?[index ?? 0]?.data?.thumbnail}'
              : checkIfImageUrl,
          errorBuilder: (context, error, stackTrace) => _errorBuilder(),
          fit: BoxFit.cover,
          height: 70,
          width: 60,
        ),
      );

  ClipRRect _errorBuilder() => ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: const Icon(
          Icons.remove_circle,
          color: Colors.red,
          size: 60,
        ),
      );

  Center _initialState() => const Center(
        child: Text(blocRedditInitialMessage),
      );
}
//