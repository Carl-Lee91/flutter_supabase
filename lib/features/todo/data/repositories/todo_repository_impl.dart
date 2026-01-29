import 'package:flutter_supabase/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:flutter_supabase/features/todo/data/models/todo_model.dart';
import 'package:flutter_supabase/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_supabase/features/todo/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource _remoteDataSource;

  TodoRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await _remoteDataSource.getTodos();
  }

  @override
  Future<void> addTodo(String title) async {
    await _remoteDataSource.addTodo(title);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await _remoteDataSource.updateTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _remoteDataSource.deleteTodo(id);
  }
}
