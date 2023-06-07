import 'package:get/get.dart';

import 'ban.dart';
import 'eng.dart';

class LanguageTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': eng,
    'bn_BD': ban,
  };
}