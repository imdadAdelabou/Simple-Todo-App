import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_cronos/providers/app_state.dart';
import 'package:provider_cronos/views/add_todo.dart';
import 'package:provider_cronos/views/see_todo.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AddTodo.routeName,
      routes: {
        AddTodo.routeName: (_) => const AddTodo(),
        SeeTodo.routeName: (_) => const SeeTodo()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
