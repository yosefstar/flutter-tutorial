import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/residence/repository/residence_data_repository.dart';
import 'package:flutter_tutorial/residence/ui/residence_data_state.dart';

final residenceDataListProvider =
    FutureProvider.autoDispose<List<ResidenceData>>((ref) async {
  final repository = ref.read(residenceDataRepositoryProvider);
  return repository.fetchResidenceData();
});
