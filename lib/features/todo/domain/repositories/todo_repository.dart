import 'package:flutter_supabase/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(String title);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}
