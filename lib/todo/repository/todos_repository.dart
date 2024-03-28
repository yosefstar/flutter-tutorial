import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/todo/data/datasource/drift_user_database.dart';

final todosRepositoryProvider = FutureProvider<TodosRepository>((ref) async {
  final database = await ref.watch(databaseProvider.future);
  return TodosRepository(database);
});

class TodosRepository {
  TodosRepository(this.db);
  final AppDatabase db;

  Future<List<Todo>> getTodos() async {
    return db.getAllTodos();
  }

  Future<void> saveTodo(TodosTableCompanion todo) async {
    await db.saveTodo(todo);
  }

  Future<void> deleteTodo(int id) async {
    await db.deleteTodo(id);
  }
}

final todosListProvider = FutureProvider<List<Todo>>((ref) async {
  // todosRepositoryProviderからTodosRepositoryのインスタンスを非同期で取得
  final todosRepository = await ref.watch(todosRepositoryProvider.future);
  // TodosRepositoryのgetTodosメソッドを呼び出してTodoリストを取得
  return todosRepository.getTodos();
});
