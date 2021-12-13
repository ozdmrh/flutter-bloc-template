import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc_template/bloc/selection_bloc.dart';
import 'package:flutter_bloc_template/bloc/selection_event.dart';

class UserPostCard extends StatefulWidget {
  final LoadedState state;
  final int index;
  const UserPostCard({Key? key, required this.state, required this.index}) : super(key: key);

  @override
  _UserPostCardState createState() => _UserPostCardState();
}

class _UserPostCardState extends State<UserPostCard> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              //leading: const Icon(Icons.podcasts_outlined),
              title: Text(widget.state.items![widget.index].title ??= 'Card Title'),
              subtitle: Text(
                widget.state.items![widget.index].body ??= 'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                  value == true ? context.read<SelectionBloc>().add(Increment()) : context.read<SelectionBloc>().add(Decrement());
                },
                tristate: false,
                activeColor: const Color(0xFF6200EE),
              ),
              //
            ),
          ],
        ),
      );
    });
  }
}

//class UserPostCard extends StatelessWidget {
//  final LoadedState state;
//  final int index;
//
//  const UserPostCard({Key? key, required this.state, required this.index}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    bool isChecked = false;
//    return Card(
//      clipBehavior: Clip.antiAlias,
//      child: Column(
//        children: [
//          ListTile(
//            //leading: const Icon(Icons.podcasts_outlined),
//            title: Text(state.items![index].title ??= 'Card Title'),
//            subtitle: Text(
//              state.items![index].body ??= 'Secondary Text',
//              style: TextStyle(color: Colors.black.withOpacity(0.6)),
//            ),
//            trailing: Checkbox(
//              onChanged: (bool? value) {
//                isChecked = value!;
//                value == true ? context.read<SelectionBloc>().add(Increment()) : context.read<SelectionBloc>().add(Decrement());
//              },
//              tristate: false,
//              value: isChecked,
//              activeColor: const Color(0xFF6200EE),
//            ),
//            //
//          ),
//        ],
//      ),
//    );
//  }
//}
