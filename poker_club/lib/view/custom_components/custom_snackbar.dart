import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';

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
          gradient: config.gradient,
        ),
      ),
    );
  }

  static _SnackbarConfig _getConfig(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarConfig(
          icon: Icons.check,
          gradient: const [Color(0xFF0F5132), Color(0xFF198754)],
        );

      case SnackbarType.error:
        return _SnackbarConfig(
          icon: Icons.close,
          gradient: [ColorPallete.redsnackbar, ColorPallete.redsnackbar],
        );

      case SnackbarType.warning:
        return _SnackbarConfig(
          icon: Icons.warning,
          gradient: const [Color(0xFF7A4F01), Color(0xFFFFA000)],
        );

      case SnackbarType.info:
      // ignore: unreachable_switch_default
      default:
        return _SnackbarConfig(
          icon: Icons.info,
          gradient: const [Color(0xFF0D47A1), Color(0xFF1976D2)],
        );
    }
  }

  /// 🔧 UI Builder
  static Widget _buildContent(
    String message, {
    required IconData icon,
    required List<Color> gradient,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(6),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  ColorPallete.redwarningtextgradient.createShader(bounds),

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
                  color: Colors.white,
                ),
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
  final List<Color> gradient;

  _SnackbarConfig({required this.icon, required this.gradient});
}
