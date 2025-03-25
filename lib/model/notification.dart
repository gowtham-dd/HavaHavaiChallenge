import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';

/// A service class to display notifications using the ElegantNotification package.
class NotificationService {
  
  /// Displays a success notification with a given [message].
  /// 
  /// - [context]: The BuildContext required to show the notification.
  /// - [message]: The success message to be displayed.
  static void showSuccessNotification(BuildContext context, String message) {
    ElegantNotification.success(
      title: const Text("Success"), // Notification title
      description: Text(message), // Dynamic message content
      toastDuration: const Duration(seconds: 3), // Duration for which the notification is visible
    ).show(context);
  }
}
