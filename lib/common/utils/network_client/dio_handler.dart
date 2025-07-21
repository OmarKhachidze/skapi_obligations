import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/app_constants.dart';

class DioHandler {
  factory DioHandler() => _instance;

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

  static final DioHandler _instance = DioHandler._internal();
}
