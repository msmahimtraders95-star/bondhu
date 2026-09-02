import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppSnackbar {
  AppSnackbar._();

  static void showSuccess(
    BuildContext context,
    String message,
  ) {
    _show(
      context,
      message,
      AppColors.success,
      Icons.check_circle_outline_rounded,
    );
  }

  static void showError(
    BuildContext context,
    String message,
  ) {
    _show(
      context,
      message,
      AppColors.danger,
      Icons.error_outline_rounded,
    );
  }

  static void showInfo(
    BuildContext context,
    String message,
  ) {
    _show(
      context,
      message,
      AppColors.primary,
      Icons.info_outline_rounded,
    );
  }

  static void _show(
    BuildContext context,
    String message,
    Color color,
    IconData icon,
  ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
  }
}
