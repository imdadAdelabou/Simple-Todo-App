import 'package:flutter/material.dart';
import 'package:provider_cronos/models/todo.dart';

class AppState extends ChangeNotifier {
  List<Todo> todos = [];
  int currentIndex= 0;

  setCurrentIndex(int value) {
    currentIndex = value;

    notifyListeners();
  }

  addTodo(Todo todo) {
    todos.add(todo);

    print(todos);
    notifyListeners();
  }

  removeTodo(Todo todo) {
    todos.remove(todo);

    print(todos);
    notifyListeners();
  }
}
