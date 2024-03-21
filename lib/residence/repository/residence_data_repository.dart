import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/residence/api/residence_api.dart';
import 'package:flutter_tutorial/residence/ui/residence_data_state.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((_) {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger());
  return dio;
});

final residenceApiClientProvider = Provider<ResidenceApiClient>((ref) {
  final dio = ref.read(dioProvider);
  return ResidenceApiClient(dio);
});

final residenceDataRepositoryProvider =
    Provider<ResidenceDataRepository>((ref) {
  return ResidenceDataRepository(ref);
});

class ResidenceDataRepository {
  ResidenceDataRepository(this._ref);

  final Ref _ref;

  Future<List<ResidenceData>> fetchResidenceData() async {
    final apiClient = _ref.read(residenceApiClientProvider);
    return apiClient.fetchResidenceData();
  }
}
