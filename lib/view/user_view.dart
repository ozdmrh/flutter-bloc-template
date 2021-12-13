import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc_template/bloc/user_bloc.dart';
import 'package:flutter_bloc_template/bloc/user_posts_bloc.dart';
import 'package:flutter_bloc_template/view/user_card.dart';
import 'package:flutter_bloc_template/view/user_posts_view.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UserBloc, GenericState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async => BlocProvider.of<UserBloc>(context).add(PullToRefreshEvent()),
            child: getWidget(
              state,
              context,
            ),
          );
        },
      ),
    );
  }

  Widget getWidget(state, context) {
    if (state is LoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is LoadedState) {
      return ListView.builder(
        itemCount: state.items!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('${state.items![index].username}');
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider<UserPostsBloc>(
                      create: (context) => UserPostsBloc(state.items![index].id)..add(LoadEvent()), child: const UserPostsView()),
                ),
              );
            },
            child: UserCard(state: state, index: index),
          );
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
