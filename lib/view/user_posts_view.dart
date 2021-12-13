import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/selection_bloc.dart';
import 'package:flutter_bloc_template/bloc/selection_event.dart';
import 'package:flutter_bloc_template/bloc/user_posts_bloc.dart';
import 'package:flutter_bloc_template/view/user_post_card.dart';

class UserPostsView extends StatelessWidget {
  const UserPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SelectionBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User Posts'),
            actions: <Widget>[
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      icon: const Icon(Icons.delete_forever),
                      label: const Text(''),
                      key: const Key('cart'),
                    ),
                  ),
                  BlocBuilder<SelectionBloc, int>(
                    builder: (context, count) {
                      return Positioned(
                        left: 30,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                          child: Text(
                            '$count',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          body: BlocBuilder<UserPostsBloc, GenericState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async => BlocProvider.of<UserPostsBloc>(context).add(PullToRefreshEvent()),
                child: getWidget(state, context),
              );
            },
          ),
        ));
  }

  Widget getWidget(state, context) {
    if (state is LoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is LoadedState) {
      BlocProvider.of<SelectionBloc>(context).add(Reset());
      return ListView.builder(
        itemCount: state.items!.length,
        itemBuilder: (context, index) {
          return UserPostCard(state: state, index: index);
        },
      );
    } else if (state is FailedToLoadState) {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Error occured: ${state.exception}'),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
