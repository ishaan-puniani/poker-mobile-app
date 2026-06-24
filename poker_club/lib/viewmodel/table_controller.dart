import 'package:get/get.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/game_service.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import 'package:poker_club/viewmodel/wallet_controller.dart';

class TableController extends GetxController {
  final _tables = <GameTable>[].obs;
  List<GameTable> get tables =>
      _tables.where((table) => table.isActive).toList();
  final isLoading = false.obs;
  final selectedTableIndex = 0.obs;

  Future<void> fetchTables(String apiUrl) async {
    isLoading.value = true;
    try {
      _tables.value = await GameService.fetchTables(apiUrl);
      selectedTableIndex.value = 0;
    } catch (_) {
      // tables stays empty
    } finally {
      isLoading.value = false;
    }
  }

  void selectTable(int index) => selectedTableIndex.value = index;

  void playSelectedTable() {
    final selectedTable = tables[selectedTableIndex.value];
    final authController = Get.find<AuthController>();
    final walletController = Get.find<WalletController>();

    if (walletController.balance.value <
        selectedTable.minBuyIn + selectedTable.entryFee) {
      CustomSnackbar.show(
        'Insufficient Balance, your balance is lower than the minimum buy-in for this table.',
        Get.context!,
        type: SnackbarType.error,
      );
      return;
    }

    final user = authController.user.value;
    final queryParameters = {
      'account': user?.id,
      'currency': user?.currency,
      'pToken': authController.token.value,
      'tenantId': ApiService.tenantId,
    };
    final gameEndpoint =
        "https://poker-game-client.web.app/play/${selectedTable.id}";

    final gameUrl = Uri.parse(
      gameEndpoint,
    ).replace(queryParameters: queryParameters);

    Get.toNamed('/play', arguments: gameUrl.toString());
  }
}
