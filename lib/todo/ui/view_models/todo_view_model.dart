import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/todo/data/datasource/drift_user_database.dart';
import 'package:flutter_tutorial/todo/repository/todos_repository.dart';
import 'package:flutter_tutorial/todo/ui/state/todo_state.dart';

class TodosViewModel extends StateNotifier<TodoState> {
  TodosViewModel(this.ref) : super(const TodoState.loading()) {
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

  Future<void> addNewTodo(
    String title,
    String content,
    DateTime? dueDate,
  ) async {
    try {
      // todosRepositoryProviderからTodosRepositoryインスタンスを非同期で取得
      final todosRepository = await ref.read(todosRepositoryProvider.future);
      final newTodo = TodosTableCompanion(
        title: Value(title),
        content: Value(content),
        dueDate: Value(dueDate),
        createdDate: Value(DateTime.now()),
      );
      await todosRepository.saveTodo(newTodo);
      await loadTodos();
    } catch (e) {
      // エラー処理
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

// TodosViewModelのProviderを定義
final todosViewModelProvider =
    StateNotifierProvider<TodosViewModel, TodoState>((ref) {
  return TodosViewModel(ref);
});
