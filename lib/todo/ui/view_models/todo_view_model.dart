import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/todo/data/datasource/drift_user_database.dart';
import 'package:flutter_tutorial/todo/repository/todos_repository.dart';
import 'package:flutter_tutorial/todo/ui/state/todo_state.dart';

class TodosNotifier extends StateNotifier<TodoState> {
  TodosNotifier(this.ref) : super(const TodoState.initial()) {
    loadTodos();
  }

  final Ref ref;

  Future<void> loadTodos() async {
    state = const TodoState.loading();
    try {
      final todosRepository = await ref.read(todosRepositoryProvider.future);
      final todos = await todosRepository.getTodos();
      state = TodoState.loaded(todos);
    } on Exception catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<void> addTodo(Todo todo) async {
    try {
      final todosRepository = await ref.read(todosRepositoryProvider.future);
      await todosRepository.addTodo(todo);
      await loadTodos(); // リストを再読み込みしてUIを更新
    } on Exception catch (e) {
      state = TodoState.error(e.toString());
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final todosRepository = await ref.read(todosRepositoryProvider.future);
      await todosRepository.deleteTodo(id);
      await loadTodos(); // リストを再読み込みしてUIを更新
    } on Exception catch (e) {
      state = TodoState.error(e.toString());
    }
  }
}

// TodosNotifierのProviderを定義
final todosNotifierProvider =
    StateNotifierProvider<TodosNotifier, TodoState>((ref) {
  return TodosNotifier(ref);
});
