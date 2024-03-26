import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_tutorial/todo/drift_user_database.dart';
import 'package:intl/intl.dart'; // DateFormatを使用するために必要

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  final AppDatabase db = AppDatabase();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late final TodoDeleter _todoDeleter;

  @override
  void initState() {
    super.initState();
    _todoDeleter = TodoDeleter(db: db);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<List<Todo>>(
          stream: db.watchAllTodos(),
          builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final todos = snapshot.data ?? [];
              if (todos.isEmpty) {
                return const Text('登録してるToDoはありません');
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
                          onPressed: (context) =>
                              _deleteTodo(context, todo, index),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'タイトル: ${todo.title}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            todo.content ?? '内容なし',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '作成日: $createdDateStr',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '期日: $dueDateStr',
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: ShowAddTodoDialog(db: db),
    );
  }

  Future<void> _deleteTodo(BuildContext context, Todo todo, int index) async {
    await _todoDeleter.deleteTodo(context, todo);
  }
}

class TodoDeleter {
  TodoDeleter({required this.db});
  final AppDatabase db;

  Future<void> deleteTodo(BuildContext context, Todo todo) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final isSuccess = await db.deleteTodo(todo.id);
    if (isSuccess) {
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('削除に失敗しました。')),
      );
    }
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

class ShowAddTodoDialog extends StatelessWidget {
  const ShowAddTodoDialog({super.key, required this.db});
  final AppDatabase db;

  void _showDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AddTodoDialog(db: db);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showDialog(context),
      tooltip: 'Add Todo',
      child: const Icon(Icons.add),
    );
  }
}

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key, required this.db});
  final AppDatabase db;

  @override
  AddTodoDialogState createState() => AddTodoDialogState();
}

class AddTodoDialogState extends State<AddTodoDialog> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _dateController;
  DateTime? _selectedDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('yyyy/MM/dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: ListBody(
            children: <Widget>[
              CustomTextFormField(
                controller: _titleController,
                hintText: 'タイトルを入力してください',
                icon: Icons.title,
              ),
              CustomTextFormField(
                controller: _contentController,
                hintText: '内容を入力してください',
                icon: Icons.description,
              ),
              CustomTextFormField(
                controller: _dateController,
                hintText: '期限を選択してください',
                icon: Icons.date_range,
                onTap: () => _selectDate(context),
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            TodoSaver(
              formKey: _formKey,
              titleController: _titleController,
              contentController: _contentController,
              selectedDate: _selectedDate,
              db: widget.db,
              scaffoldMessenger: ScaffoldMessenger.of(context),
              onSuccess: () => Navigator.of(context).pop(),
              onError: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('保存に失敗しました。')),
              ),
            ).saveTodo();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text('保存'),
        ),
      ],
    );
  }
}

class TodoSaver {
  TodoSaver({
    required this.formKey,
    required this.titleController,
    required this.contentController,
    required this.selectedDate,
    required this.db,
    required this.scaffoldMessenger,
    required this.onSuccess,
    required this.onError,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final DateTime? selectedDate;
  final AppDatabase db;
  final ScaffoldMessengerState scaffoldMessenger;
  final void Function() onSuccess;
  final void Function() onError;

  Future<void> saveTodo() async {
    if (formKey.currentState!.validate()) {
      final todo = TodosTableCompanion(
        title: Value(titleController.text),
        content: Value(contentController.text),
        dueDate: Value(selectedDate ?? DateTime.now()),
        createdDate: Value(DateTime.now()),
      );
      try {
        final id = await db.into(db.todosTable).insert(todo);
        if (id > 0) {
          onSuccess();
        } else {
          onError();
        }
      } on Exception {
        onError();
      }
    }
  }
}
