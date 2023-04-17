import 'dart:convert';
// import 'todo.dart' as todo;
import 'package:http/http.dart' as http;

import 'todo.dart';

class HttpRq {
  final String _baseUrl = "http://192.168.18.51:8888";
  final Map<String, String> _headers = {'Content-type': 'application/json'};

  // GET request
  Future<List<Todo>> getTodos() async {
    try {
      final http.Response response =
          await http.get(Uri.parse("$_baseUrl/todo"));
      // print(response.statusCode);
      // print(response.body);

      //CONVERTING JSON TO DART <LIST>
      final List<Todo> todos = ((jsonDecode(response.body)) as List)
          .map((item) =>
              Todo(item['title'], item['description'], item['completed']))
          .toList();

      return todos;
    } catch (e) {
      return [];
    }
  }

  Future<void> getMytodo() async {
    try {
      final http.Response response =
          await http.get(Uri.parse("$_baseUrl/todo"));
      // print(response.statusCode);
      // print(response.body);
    } catch (e) {}
  }

//POST request
  Future<void> addTodo(Todo todo) async {
    try {
      // ignore: unnecessary_string_interpolations, unused_local_variable
      final http.Response response = await http.post(
          Uri.parse("$_baseUrl/todo"),
          body: jsonEncode(todo.toJson()),
          headers: _headers);
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

// PUT request
  Future<void> updateTodo(int id, Todo todo) async {
    try {
      // ignore: unnecessary_string_interpolations, unused_local_variable
      final http.Response response = await http.put(
          Uri.parse("$_baseUrl/todo/$id"),
          body: jsonEncode(todo.toJson()),
          headers: _headers);
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  //DELETE request
  Future<void> deleteTodo(int id) async {
    try {
      final http.Response response = await http.delete(
        Uri.parse("$_baseUrl/todo/$id"),
      );
    } catch (e) {
      print(e);
    }
  }
}
