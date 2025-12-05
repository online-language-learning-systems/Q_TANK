import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/index.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final socketBloc = SocketBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => socketBloc),
        BlocProvider(create: (_) => RoomBloc(socketBloc: socketBloc)),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
