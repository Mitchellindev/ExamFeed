import 'package:exam_feed/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

extension ToastUtil on BuildContext {
  void showErrorMessage({String? message}) {
    showSimpleNotification(
      Text(message ?? 'An error occurred'),
      background: AppColors.error,
    );
  }

  void showSuccessMessage({String? message}) {
    showSimpleNotification(
      Text(message ?? 'Success'),
      background: AppColors.success,
    );
  }
}
