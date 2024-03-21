import 'package:dio/dio.dart';
import 'package:flutter_tutorial/residence/ui/residence_data_state.dart';
import 'package:retrofit/retrofit.dart';

part 'residence_api.g.dart';

@RestApi(baseUrl: 'https://tutorial7-1.web.app/api/v1/')
abstract class ResidenceApiClient {
  factory ResidenceApiClient(Dio dio, {String baseUrl}) = _ResidenceApiClient;

  @GET('/residence/index.json')
  Future<List<ResidenceData>> fetchResidenceData();
}
