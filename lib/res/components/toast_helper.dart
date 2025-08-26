import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void showSuccess({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    _showToast(
      context: context,
      message: message,
      title: title ?? "Success",
      type: ToastificationType.success,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    _showToast(
      context: context,
      message: message,
      title: title ?? "Error",
      type: ToastificationType.error,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    _showToast(
      context: context,
      message: message,
      title: title ?? "Warning",
      type: ToastificationType.warning,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    String? title,
  }) {
    _showToast(
      context: context,
      message: message,
      title: title ?? "Info",
      type: ToastificationType.info,
    );
  }

  static void _showToast({
    required BuildContext context,
    required String message,
    required ToastificationType type,
    String? title,
  }) {
    toastification.show(
      context: context,
      title: Text(title ?? ''),
      description: Text(message),
      type: type,
      style: ToastificationStyle.fillColored,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      icon: type == ToastificationType.success
          ? const Icon(Icons.check_circle, color: Colors.white)
          : null,
      showProgressBar: true,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}
