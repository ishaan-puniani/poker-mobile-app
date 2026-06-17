import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poker_club/model/user_profile.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/custom_icon_button.dart';

class MainMenuSidebar extends StatelessWidget {
  const MainMenuSidebar({
    super.key,
    required this.user,
    required this.menuOptions,
    required this.selectedIndex,
    required this.onSelect,
    required this.onClose,
  });

  final UserProfile? user;
  final List<String> menuOptions;
  final int? selectedIndex;
  final ValueChanged<int?> onSelect;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF500C0C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(8).r,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8A0022), Color(0xFF4A0414)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              border: Border(
                bottom: BorderSide(color: Color(0xFF7A1024), width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lukkywin Poker',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CustomIconButton(
                  icon: AppIcons.close,
                  size: 24.r,
                  iconSize: 14.r,
                  backgroundColor: const Color(
                    0xFF380000,
                  ).withValues(alpha: 0.7),
                  onTap: onClose,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8).r,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF7A1024), width: 0.5),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35.r,
                  child: SvgPicture.asset(
                    UserProfile.getAvatarAsset(user?.avatar),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.username ?? 'Guest',
                      style: TextStyle(
                        color: ColorPallete.lightyellow,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Player ID: ${user?.playerId ?? 'N/A'}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8).r,
            color: const Color(0xFF6C1111),
            child: Text(
              'Your Info',
              style: TextStyle(
                color: const Color(0xFFFFEEC2),
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...List.generate(
            menuOptions.length,
            (index) => _MainMenuRow(
              label: menuOptions[index],
              selected: selectedIndex == index,
              onTap: () => onSelect(index),
            ),
          ),
        ],
      ),
    );
  }
}

class _MainMenuRow extends StatelessWidget {
  const _MainMenuRow({
    required this.label,
    required this.onTap,
    required this.selected,
  });

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8).r,
        decoration: BoxDecoration(
          gradient: selected
              ? const LinearGradient(
                  colors: [Color(0xFF58150F), Color(0xFF902320)],
                )
              : null,
          border: const Border(
            bottom: BorderSide(color: Color(0xFF7A1024), width: 0.1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: ColorPallete.lightyellow,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomIconButton(
              icon: AppIcons.chevronRight,
              size: 24.r,
              iconSize: 14.r,
              backgroundColor: const Color(
                0xFF380000,
              ).withValues(alpha: 0.7),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
