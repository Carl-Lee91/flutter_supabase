import 'package:flutter_supabase/features/todo/data/models/todo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(String title);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(String id);
}

@LazySingleton(as: TodoRemoteDataSource)
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final SupabaseClient _supabaseClient;

  TodoRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<TodoModel>> getTodos() async {
    final response = await _supabaseClient
        .from('todos')
        .select()
        .order('created_at', ascending: false);

    return (response as List).map((e) => TodoModel.fromJson(e)).toList();
  }

  @override
  Future<void> addTodo(String title) async {
    await _supabaseClient.from('todos').insert({
      'title': title,
      'is_completed': false,
    });
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    await _supabaseClient
        .from('todos')
        .update({'is_completed': todo.isCompleted})
        .eq('id', todo.id);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _supabaseClient.from('todos').delete().eq('id', id);
  }
}
