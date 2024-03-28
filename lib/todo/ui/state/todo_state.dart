import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_tutorial/todo/data/datasource/drift_user_database.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.loading() = _Loading;
  const factory TodoState.loaded(List<Todo> todos) = _Loaded;
  const factory TodoState.error(String error) = _Error;
}
