import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, warning, info }

class CustomSnackbar {
  static void show(
    String message,
    BuildContext context, {
    SnackbarType type = SnackbarType.info,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 2),
  }) {
    final config = _getConfig(type);

    Get.showSnackbar(
      GetSnackBar(
        snackPosition: position,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        duration: duration,
        maxWidth: 450.w,

        messageText: _buildContent(
          context: context,
          message,
          icon: config.icon,
          color: config.color,
        ),
      ),
    );
  }

  static _SnackbarConfig _getConfig(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarConfig(icon: Icons.check, color: Colors.green.shade700);

      case SnackbarType.error:
        return _SnackbarConfig(icon: Icons.close, color: Colors.red.shade700);

      case SnackbarType.warning:
        return _SnackbarConfig(
          icon: Icons.warning,
          color: Colors.orange.shade700,
        );

      case SnackbarType.info:
      // ignore: unreachable_switch_default
      default:
        return _SnackbarConfig(icon: Icons.info, color: Colors.blue.shade700);
    }
  }

  /// 🔧 UI Builder
  static Widget _buildContent(
    String message, {
    required IconData icon,
    required Color color,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: color.withValues(alpha: .15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            padding: const EdgeInsets.all(4).r,
            child: Icon(icon, color: Colors.white, size: 14.r),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: .8), // ✅ 80% shadow
                    blurRadius: 50.r,
                    offset: Offset(2, 2),
                  ),
                ],
                fontSize: 13.sp,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Helper model
class _SnackbarConfig {
  final IconData icon;
  final Color color;

  _SnackbarConfig({required this.icon, required this.color});
}
