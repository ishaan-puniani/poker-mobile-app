import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker_club/view/custom_components/player_name_input_dialog.dart';

void showInputNameDialog(Function(String? name) onNameSubmitted) {
  Get.dialog(
    Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: PlayerNameInputDialog(),
    ),
  );
}
