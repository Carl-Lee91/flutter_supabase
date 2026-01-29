import 'package:flutter_supabase/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_supabase/features/todo/domain/repositories/todo_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTodosUseCase {
  final TodoRepository _repository;

  GetTodosUseCase(this._repository);

  Future<List<Todo>> call() {
    return _repository.getTodos();
  }
}

@injectable
class AddTodoUseCase {
  final TodoRepository _repository;

  AddTodoUseCase(this._repository);

  Future<void> call(String title) {
    return _repository.addTodo(title);
  }
}

@injectable
class UpdateTodoUseCase {
  final TodoRepository _repository;

  UpdateTodoUseCase(this._repository);

  Future<void> call(Todo todo) {
    return _repository.updateTodo(todo);
  }
}

@injectable
class DeleteTodoUseCase {
  final TodoRepository _repository;

  DeleteTodoUseCase(this._repository);

  Future<void> call(String id) {
    return _repository.deleteTodo(id);
  }
}
