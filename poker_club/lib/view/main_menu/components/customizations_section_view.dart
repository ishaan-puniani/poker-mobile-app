import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker_club/model/user_profile.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/main_menu/main_menu_data.dart';

class CustomizationsSectionView extends StatelessWidget {
  const CustomizationsSectionView({
    super.key,
    required this.selectedAvatar,
    required this.onAvatarSelected,
    required this.onSave,
    required this.isSaving,
  });

  final String selectedAvatar;
  final ValueChanged<String> onAvatarSelected;
  final Future<void> Function() onSave;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(22.w, 16.h, 22.w, 12.h),
              scrollDirection: Axis.horizontal,
              itemCount: MainMenuData.avatarOptions.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.r,
                crossAxisSpacing: 16.r,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final avatarId = MainMenuData.avatarOptions[index];
                final isSelected = avatarId == selectedAvatar;
                return _AvatarOption(
                  avatarId: avatarId,
                  isSelected: isSelected,
                  onTap: () => onAvatarSelected(avatarId),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CustomButton(
                backgroundGradient: ColorPallete.rightbuttongradient,
                textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorPallete.brown,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
                radius: 12.r,
                width: 124,
                height: 38,

                onPressed: onSave,
                text: 'SAVE',
                isLoading: isSaving,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarOption extends StatelessWidget {
  const _AvatarOption({
    required this.avatarId,
    required this.isSelected,
    required this.onTap,
  });

  final String avatarId;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? ColorPallete.lighteryellow
                : ColorPallete.borderyellow,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: ColorPallete.yellow.withValues(alpha: 0.35),
                    blurRadius: 14.r,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        padding: EdgeInsets.all(isSelected ? 2.w : 0.w),
        child: ClipOval(
          child: ColoredBox(
            color: const Color(0xFF481010),
            child: SvgPicture.asset(
              UserProfile.getAvatarAsset(avatarId),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
