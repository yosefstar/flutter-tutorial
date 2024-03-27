import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/todo/ui/view_models/todo_view_model.dart';
import 'package:intl/intl.dart'; // DateFormatを使用するために必要

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderから状態を取得
    final todoState = ref.watch(todosViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: todoState.when(
        initial: () => const Center(child: Text('データを読み込んでいます...')),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (todos) {
          if (todos.isEmpty) {
            return const Center(child: Text('登録してるToDoはありません'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              final createdDateStr =
                  DateFormat('yyyy-MM-dd').format(todo.createdDate);
              final dueDateStr = todo.dueDate != null
                  ? DateFormat('yyyy-MM-dd').format(todo.dueDate!)
                  : '期限なし';

              return Slidable(
                key: ValueKey(todo.id),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        ref
                            .read(todosViewModelProvider.notifier) // ここを変更
                            .deleteTodo(todo.id);
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(todo.title),
                  subtitle: Text(
                    '${todo.content ?? "内容なし"}\n'
                    '作成日: $createdDateStr 期日: $dueDateStr',
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
        error: (error) => Center(child: Text('エラーが発生しました: $error')),
      ),
      floatingActionButton: const ShowAddTodoDialog(),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.onTap,
    this.readOnly = false,
  });
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '値を入力してください';
              }
              return null;
            },
            onTap: onTap,
            readOnly: readOnly,
          ),
        ),
      ],
    );
  }
}

class ShowAddTodoDialog extends ConsumerWidget {
  const ShowAddTodoDialog({super.key});

  void _showDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return const AddTodoDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => _showDialog(context, ref),
      tooltip: 'Add Todo',
      child: const Icon(Icons.add),
    );
  }
}

class AddTodoDialog extends ConsumerWidget {
  const AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    final dateController = TextEditingController();
    DateTime? selectedDate;

    Future<void> selectDate(BuildContext context) async {
      final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy/MM/dd').format(picked);
      }
    }

    Future<void> saveTodo() async {
      if (formKey.currentState!.validate()) {
        final navigator = Navigator.of(context);
        // ViewModelを通じて新しいToDoを追加
        await ref.read(todosViewModelProvider.notifier).addNewTodo(
              titleController.text,
              contentController.text,
              selectedDate,
            );

        if (navigator.mounted) {
          navigator.pop();
        }
      }
    }

    return AlertDialog(
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: ListBody(
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'タイトルを入力してください'),
              ),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(hintText: '内容を入力してください'),
              ),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(hintText: '期限を選択してください'),
                onTap: () => selectDate(context),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: saveTodo,
          child: const Text('保存'),
        ),
      ],
    );
  }
}
