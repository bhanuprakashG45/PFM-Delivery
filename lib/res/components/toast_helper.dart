import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastMessage {
  static void showToast(
    BuildContext context, {
    required String message,
    required Widget icon,
  }) {
    toastification.show(
      context: context,
      description: Text(message),
      style: ToastificationStyle.flat,
      type: ToastificationType.error,
      icon: icon,
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topRight,
    );
  }
}
