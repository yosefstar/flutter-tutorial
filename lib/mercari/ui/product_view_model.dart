import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/mercari/repository/product_repository.dart';
import 'package:flutter_tutorial/mercari/ui/product_data_state.dart';

final productDataListProvider =
    FutureProvider.autoDispose<List<ProductData>>((ref) async {
  final repository = ref.read(productRepositoryProvider);
  return repository.fetchProductData();
});
