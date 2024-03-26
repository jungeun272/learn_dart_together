import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/240326/model/todo.dart';
import 'package:learn_dart_together/240326/repository/todo_repository.dart';
import 'package:learn_dart_together/240326/repository/todo_repository_implements.dart';

class TodoApi {
  Future<List<Todo>> getTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<List<Todo>> getCompletedTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}

void main() async {
  TodoRepository todoRepo = TodoRepositoryImpl();
  final result = await todoRepo.getCompletedTodos();
  print(result);
}
