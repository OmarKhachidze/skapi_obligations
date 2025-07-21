import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/localization_extension.dart';

enum SkapiErrorType { network, timeout, unknown }

extension DioExceptionMapping on DioException {
  SkapiErrorType toSkapiErrorType() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return SkapiErrorType.timeout;
      case DioExceptionType.connectionError:
        return SkapiErrorType.network;
      default:
        return SkapiErrorType.unknown;
    }
  }
}

extension SkapiErrorTypeExtension on SkapiErrorType {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case SkapiErrorType.network:
        return context.localization.networkError;
      case SkapiErrorType.timeout:
        return context.localization.timeoutError;
      case SkapiErrorType.unknown:
        return context.localization.unknownError;
    }
  }
}
