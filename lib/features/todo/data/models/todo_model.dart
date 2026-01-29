import 'package:flutter_supabase/features/todo/domain/entities/todo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.title,
    required super.isCompleted,
    required super.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);

  factory TodoModel.fromEntity(Todo todo) {
    return TodoModel(
      id: todo.id,
      title: todo.title,
      isCompleted: todo.isCompleted,
      createdAt: todo.createdAt,
    );
  }
}
