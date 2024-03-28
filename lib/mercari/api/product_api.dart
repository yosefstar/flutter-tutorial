import 'package:dio/dio.dart';
import 'package:flutter_tutorial/mercari/ui/product_data_state.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api.g.dart';

@RestApi(baseUrl: 'https://tutorial7-1.web.app/api/v1/')
abstract class ProductApiClient {
  factory ProductApiClient(Dio dio, {String baseUrl}) = _ProductApiClient;

  @GET('/mercari/index.json')
  Future<List<ProductData>> fetchProductData();
}
