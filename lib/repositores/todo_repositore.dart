import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../pages/models/todo.dart';

class TodoRepository{
  late SharedPreferences sharedPreferences;

  static const todoListKey = 'todo_list';
  Future <List<Todo>> getTodoList()async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey)?? '[]';
    final List  jsonDecoded = json.decode(jsonString) as List;
     return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos){
    final String jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);

  }

}