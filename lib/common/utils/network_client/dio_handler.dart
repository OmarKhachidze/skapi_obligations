import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/app_constants.dart';

final getIt = GetIt.instance;

class DioHandler {
  DioHandler._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        ),
      ) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  final Dio dio;

  static void setupDio() {
    getIt.registerLazySingleton(() => DioHandler._internal());
  }
}
