import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/bloc/generic_event.dart';
import 'package:flutter_bloc_template/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/view/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<UserBloc>(
      create: (context) => UserBloc()..add(LoadEvent()),
      child: const UserView(),
    ));
  }
}
