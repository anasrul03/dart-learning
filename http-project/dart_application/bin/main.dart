// import 'dart:html';

// import 'package:dart_application/dart_application.dart' as dart_application;

import 'dart:io';

import 'http_req.dart';
import 'todo.dart';

Future<void> main(List<String> arguments) async {
  HttpRq httpReq = HttpRq();
  // httpReq.getMytodo();
  final List<Todo> todoList = await httpReq.getTodos();
  // for (int i = 1; i <= 10; i++) {
  //   print("object");
  //   stdout.write("${todoList[i].id} .");
  //   stdout.write("${todoList[i].title}");
  //   stdout.write("\t \t${todoList[i].comple##ted}");
  //   // print("#############################");
  // }

  for (Todo todo in todoList) {
    if (todo.title.contains('Hanasrullah bin Halim')) {
      print(todo);
    }
  }

  // httpReq.addTodo(Todo(
  //     'Hanasrullah bin Halim', 'Doing Mobile Development module', false, 1));
  // httpReq.updateTodo(
  //     1,
  //     Todo(
  //       "Hanasrullah bin Halim",
  //       "Love Mobile Dev",
  //       true,
  //     ));

  // httpReq.deleteTodo(100);
}
