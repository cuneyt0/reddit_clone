import 'package:case_reddit/app/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reddit_bloc.dart';

class RedditHomeView extends StatelessWidget {
  const RedditHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final RedditBloc redditBloc = getIt.get<RedditBloc>();

    //final redditBloc = getIt.get<BlocProvider.of<RedditBloc>(context)>();
    return Scaffold(
      appBar: AppBar(title: const Text('Reddit Clone')),
      body: BlocBuilder(
        bloc: redditBloc,
        builder: ((context, state) {
          if (state is RedditInitial) {
            return const Center(
              child: Text("Mavi Butona Tıklayınız"),
            );
          } else if (state is RedditLoadedState) {
            final response = state.model;
            return RefreshIndicator(
              onRefresh: () async =>
                  redditBloc.add(getRefreshPostsEvent(count: 20)),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: response?.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(response?[index]?.data?.title ?? ''),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(90.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 24,
                                minHeight: 34,
                                maxWidth: 44,
                                maxHeight: 64,
                              ),
                              child: Image.network(
                                (response?[index]?.data?.thumbnail != 'self' ||
                                        response?[index]?.data?.thumbnail !=
                                            'default')
                                    ? '${response?[index]?.data?.thumbnail}'
                                    : 'https://www.vectorstock.com/royalty-free-vector/multiplication-button-or-x-icon-vector-10273548',
                                errorBuilder: (context, error, stackTrace) =>
                                    ClipRRect(
                                  borderRadius: BorderRadius.circular(90.0),
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minWidth: 24,
                                      minHeight: 34,
                                      maxWidth: 44,
                                      maxHeight: 64,
                                    ),
                                    child: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          subtitle: Text(
                              '${response?[index]?.data?.all_awardings?[index]?.description}'),
                        );
                      }),
                    ),
                  ),
                )
              ]),
            );
          } else if (state is RedditFailedState) {
            return Center(child: Text(state.message.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          redditBloc.add(getPostsEvent(count: 20));
        },
      ),
    );
  }
}
//