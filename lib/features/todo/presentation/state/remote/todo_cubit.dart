import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supabase/features/todo/domain/entities/todo_entity.dart';
import 'package:flutter_supabase/features/todo/domain/usecases/todo_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'todo_cubit.freezed.dart';
part 'todo_state.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  final GetTodosUseCase _getTodosUseCase;
  final AddTodoUseCase _addTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoCubit(
    this._getTodosUseCase,
    this._addTodoUseCase,
    this._updateTodoUseCase,
    this._deleteTodoUseCase,
  ) : super(const TodoState.initial());

  Future<void> loadTodos() async {
    emit(const TodoState.loading());
    try {
      final todos = await _getTodosUseCase();
      emit(TodoState.loaded(todos));
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> addTodo(String title) async {
    try {
      await _addTodoUseCase(title);
      loadTodos();
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> toggleTodo(Todo todo) async {
    try {
      final updatedTodo = Todo(
        id: todo.id,
        title: todo.title,
        isCompleted: !todo.isCompleted,
        createdAt: todo.createdAt,
      );
      await _updateTodoUseCase(updatedTodo);
      loadTodos();
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _deleteTodoUseCase(id);
      loadTodos();
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }
}
