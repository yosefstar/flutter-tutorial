import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'drift_user_database.dart';

final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  final database = AppDatabase();
  return database;
});
