import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/model/user_profile.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/player_service.dart';
import 'package:poker_club/view/custom_components/custom_icon_button.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/view/main_menu/main_menu_data.dart';
import 'package:poker_club/view/main_menu/components/customizations_section_view.dart';
import 'package:poker_club/view/main_menu/components/game_stats_section_view.dart';
import 'package:poker_club/view/main_menu/components/main_menu_sidebar.dart';
import 'package:poker_club/view/main_menu/components/profile_section_view.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

void showMainMenuDialog() {
  Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: 'MainMenu',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: MainMenuDialog(),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(curved),
        child: child,
      );
    },
  );
}

class MainMenuDialog extends StatefulWidget {
  const MainMenuDialog({super.key});

  @override
  State<MainMenuDialog> createState() => _MainMenuDialogState();
}

class _MainMenuDialogState extends State<MainMenuDialog> {
  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  UserProfile? get user => authController.user.value;

  int? selectedIndex;
  bool isLoading = false;
  bool isSavingCustomization = false;
  String selectedAvatar = '1';

  @override
  void initState() {
    super.initState();
    mobileController.text = user?.mobile ?? '';
    usernameController.text = user?.username ?? '';
    selectedAvatar = _resolvedAvatar(user?.avatar);
  }

  @override
  void dispose() {
    mobileController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void selectMenu(int? index) {
    setState(() {
      selectedIndex = index;
    });
  }

  String _resolvedAvatar(String? avatar) {
    if (avatar != null && MainMenuData.avatarOptions.contains(avatar)) {
      return avatar;
    }
    return MainMenuData.avatarOptions.first;
  }

  void onAvatarSelected(String avatar) {
    setState(() {
      selectedAvatar = avatar;
    });
  }

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final username = usernameController.text.trim();
        setState(() => isLoading = true);
        final msg = await PlayerService.updatePlayerUsername(
          user?.id ?? '',
          username,
        );
        if (msg.isNotEmpty) {
          if (Get.isRegistered<AuthController>()) {
            await Get.find<AuthController>().fetchUserProfile();
          }
          if (!mounted) return;
          CustomSnackbar.show(msg, context, type: SnackbarType.success);
        }
      } catch (error) {
        final errorMsg = ApiService.getErrorMessage(error);
        if (!mounted) return;
        CustomSnackbar.show(
          errorMsg ?? 'An error occurred',
          context,
          type: SnackbarType.error,
        );
      } finally {
        if (mounted) {
          setState(() => isLoading = false);
        }
      }
    }
  }

  Future<void> onSaveCustomization() async {
    try {
      setState(() => isSavingCustomization = true);
      final currentUser = user;
      if (currentUser != null) {
        // authController.user.value = currentUser.copyWith(
        //   avatar: selectedAvatar,
        // );
        final msg = await PlayerService.addPlayerAvatar(
          currentUser.id,
          selectedAvatar,
        );
        if (msg.isNotEmpty) {
          if (Get.isRegistered<AuthController>()) {
            await Get.find<AuthController>().fetchUserProfile();
          }
          if (!mounted) return;
          CustomSnackbar.show(msg, context, type: SnackbarType.success);
        }
      }
    } finally {
      if (mounted) {
        setState(() => isSavingCustomization = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: selectedIndex != null ? ColorPallete.redCardGradient : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: MainMenuSidebar(
                user: user,
                menuOptions: MainMenuData.menuOptions,
                selectedIndex: selectedIndex,
                onSelect: selectMenu,
                onClose: Get.back,
              ),
            ),
            Expanded(
              flex: 2,
              child: selectedIndex != null
                  ? _MainMenuContent(
                      title: MainMenuData.menuOptions[selectedIndex!],
                      onBack: () => selectMenu(null),
                      child: _buildSelectedView(selectedIndex!),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedView(int index) {
    if (index == 0) {
      return ProfileSectionView(
        formKey: formKey,
        mobileController: mobileController,
        usernameController: usernameController,
        isLoading: isLoading,
        onSubmit: onSubmit,
      );
    }

    if (index == 1) {
      return const Expanded(child: GameStatsSectionView());
    }

    if (index == 2) {
      return CustomizationsSectionView(
        selectedAvatar: selectedAvatar,
        onAvatarSelected: onAvatarSelected,
        onSave: onSaveCustomization,
        isSaving: isSavingCustomization,
      );
    }

    return const SizedBox.shrink();
  }
}

class _MainMenuContent extends StatelessWidget {
  const _MainMenuContent({
    required this.title,
    required this.onBack,
    required this.child,
  });

  final String title;
  final VoidCallback onBack;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPallete.lighteryellow,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                CustomIconButton(
                  icon: AppIcons.chevronLeft,
                  size: 24.r,
                  iconSize: 14.r,
                  backgroundColor: const Color(
                    0xFF380000,
                  ).withValues(alpha: 0.7),
                  onTap: onBack,
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
