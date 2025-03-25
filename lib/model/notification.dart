import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';

class NotificationService {
  static void showSuccessNotification(BuildContext context, String message) {
    ElegantNotification.success(
      title: Text("Success"),
      description: Text(message),
      toastDuration: Duration(seconds: 3),
    ).show(context);
  }
}
