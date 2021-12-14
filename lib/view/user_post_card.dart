import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc_template/bloc/selection_bloc.dart';
import 'package:flutter_bloc_template/bloc/selection_event.dart';

class UserPostCard extends StatelessWidget {
  final LoadedState state;
  final int index;

  const UserPostCard({Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            title: Text(state.items![index].title ??= 'Card Title'),
            subtitle: Text(
              state.items![index].body ??= 'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
            trailing:
                BlocBuilder<SelectionBloc, int>(builder: (context, count) {
              return Checkbox(
                onChanged: (bool? value) {
                  state.items![index].checked = value!;
                  value == true
                      ? context.read<SelectionBloc>().add(Increment())
                      : context.read<SelectionBloc>().add(Decrement());
                },
                tristate: false,
                value: state.items![index].checked,
                activeColor: const Color(0xFF6200EE),
              );
            }),
          ),
        ],
      ),
    );
  }
}
