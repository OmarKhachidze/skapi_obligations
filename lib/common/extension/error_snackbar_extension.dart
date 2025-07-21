import 'package:flutter/material.dart';
import 'package:skapi_obligations/common/extension/dio_exception_extension.dart';
import 'package:skapi_obligations/common/extension/theme_extension.dart';

extension ErrorSnackbarExtension on BuildContext {
  void showErrorSnackBar(SkapiErrorType error) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(error.localizedMessage(this)),
        backgroundColor: skapiColors.error,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
