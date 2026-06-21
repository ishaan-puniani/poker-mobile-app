import 'dart:async';

import 'package:get/get.dart';
import 'package:poker_club/services/wallet_service.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

class WalletController extends GetxController {
  final balance = 0.0.obs;
  final isLoading = true.obs;

  Timer? _timer;

  AuthController get _auth => Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    refreshBalance();
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => refreshBalance(silent: true),
    );
  }

  /// Fetches the live balance for the logged-in user, based on their
  /// player id and currency (defaults to INR).
  Future<void> refreshBalance({bool silent = false}) async {
    final user = _auth.user.value;
    if (user == null) return;
    if (!silent) isLoading.value = true;
    balance.value = await WalletService.fetchBalance(
      playerId: user.id,
      currency: user.currency.isNotEmpty ? user.currency : 'INR',
    );
    isLoading.value = false;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
