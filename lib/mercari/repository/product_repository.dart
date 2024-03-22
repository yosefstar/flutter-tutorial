import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/mercari/api/product_api.dart';
import 'package:flutter_tutorial/mercari/ui/product_data_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((_) {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  return dio;
});

final productApiClientProvider = Provider<ProductApiClient>((ref) {
  final dio = ref.read(dioProvider);
  return ProductApiClient(dio);
});

final productRepositoryProvider = Provider<ProductDataRepository>((ref) {
  return ProductDataRepository(ref);
});

class ProductDataRepository {
  ProductDataRepository(this._ref);

  final Ref _ref;

  Future<List<ProductData>> fetchProductData() async {
    final apiClient = _ref.read(productApiClientProvider);
    return apiClient.fetchProductData();
  }
}
