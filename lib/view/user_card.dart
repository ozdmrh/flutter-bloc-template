import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';

class UserCard extends StatelessWidget {
  final LoadedState state;
  final int index;
  const UserCard({Key? key, required this.state, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _username = state.items![index].name ??= 'Card Title';
    List<String> _nameList = _username.split(' ');
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text('${_nameList[0][0]}${_nameList[1][0]}'),
            ),
            title: Text(_username),
            subtitle: Text(
              state.items![index].email ??= 'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                state.items![index].company.catchPhrase,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: const Color(0xFF6200EE), // foreground
                ),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 1'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: const Color(0xFF6200EE), // foreground
                ),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
