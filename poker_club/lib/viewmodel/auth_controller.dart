import 'package:get/get.dart';
import 'package:poker_club/model/user_profile.dart';
import 'package:poker_club/services/auth_service.dart';
import 'package:poker_club/services/pref.dart';

class AuthController extends GetxController {
  static const _tokenKey = 'token';

  final isAuthenticated = false.obs;
  final token = ''.obs;
  final user = Rxn<UserProfile>();

  /// Completes once the persisted session (and user profile, if logged in)
  /// has been loaded. The splash screen awaits this before navigating.
  late final Future<void> ready;

  @override
  void onInit() {
    super.onInit();
    ready = loadAuthState();
  }

  Future<void> loadAuthState() async {
    final savedToken = await Pref.read(_tokenKey);
    token.value = savedToken;
    isAuthenticated.value = savedToken.isNotEmpty;
    if (isAuthenticated.value) {
      await fetchUserProfile();
    }
  }

  Future<void> fetchUserProfile() async {
    final userJson = await AuthService.me();
    final authController = Get.find<AuthController>();
    if (userJson['success'] == false) {
      await authController.logout();
      return;
    }
    user.value = UserProfile.fromJson(userJson);
  }

  Future<void> setToken(String value) async {
    token.value = value;
    isAuthenticated.value = value.isNotEmpty;

    if (value.isEmpty) {
      await Pref.remove(_tokenKey);
      return;
    }
    await Pref.write(_tokenKey, value);
    await fetchUserProfile();
  }

  Future<void> logout() async {
    token.value = '';
    isAuthenticated.value = false;
    await AuthService.signOut();
  }

  bool get hasToken => token.value.isNotEmpty;
}
