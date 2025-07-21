import 'package:dio/dio.dart';
import 'package:skapi_obligations/common/constants/app_constants.dart';

import '../../../../common/utils/network_client/dio_handler.dart';

class ObligationsRemoteDataSource {
  final Dio _dio = getIt<DioHandler>().dio;

  Future<Response> getOtherObligations() async {
    return _dio.get(otherObligationsEndpoint);
  }

  Future<Response> getGoldObligations() async {
    return _dio.get(goldObligationsEndpoint);
  }

  Future<Response> getObligationsTransactions() async {
    return _dio.get(
      obligationsTransactionsEndpoint,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
      ),
    );
  }
}
