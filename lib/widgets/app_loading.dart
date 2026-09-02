import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppLoading extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const AppLoading({
    super.key,
    this.size = 30,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
