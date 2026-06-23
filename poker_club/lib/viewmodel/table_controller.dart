import 'package:get/get.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/services/game_service.dart';

class TableController extends GetxController {
  final tables = <GameTable>[].obs;
  final isLoading = false.obs;
  final selectedTableIndex = 0.obs;

  Future<void> fetchTables(String apiUrl) async {
    isLoading.value = true;
    try {
      tables.value = await GameService.fetchTables(apiUrl);
      selectedTableIndex.value = 0;
    } catch (_) {
      // tables stays empty
    } finally {
      isLoading.value = false;
    }
  }

  void selectTable(int index) => selectedTableIndex.value = index;
}
