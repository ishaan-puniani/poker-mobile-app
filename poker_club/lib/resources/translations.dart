import 'package:get/get.dart';
import 'package:poker_club/resources/languages/en_us.dart';
import 'package:poker_club/resources/languages/hi_in.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'hi_IN': hiIN};
}
