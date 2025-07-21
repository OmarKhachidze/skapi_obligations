import 'package:dio/dio.dart';
import 'package:skapi_obligations/common/constants/app_constants.dart';

class ObligationsRemoteDataSource {
  ObligationsRemoteDataSource(this._dio);

  final Dio _dio;

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
