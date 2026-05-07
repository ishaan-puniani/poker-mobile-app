import 'package:flutter/material.dart';
import 'package:poker_club/view/custom_components/player_name_input_dialog.dart';

void showInputNameDialog(
  BuildContext context,
  Function(String? name) onNameSubmitted,
) {
  showDialog(
    context: context,
    useSafeArea: false, // Allows dialog to cover system status bars
    builder: (context) => Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: PlayerNameInputDialog(),
    ),
  );
}
