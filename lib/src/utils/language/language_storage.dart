

import '../global/global.dart';

const languageKey = 'language';
const languageCode1Key = 'languageCode1';
const languageCode2Key = 'languageCode2';

class StorageData {
  static Future<void> setLanguage({required String language}) async {
    await Global.storage.write(languageKey, language);
  }

  static String getLanguage({required String key}) {
    return Global.storage.read(key) ?? 'English';
  }

  static Future<void> setLanguageCode1({
    required String l1,
  }) async {
    await Global.storage.write(languageCode1Key, l1);
  }

  static String getLanguageCode1({required String key}) {
    return Global.storage.read(key) ?? 'en';
  }

  static Future<void> setLanguageCode2({
    required String l2,
  }) async {
    await Global.storage.write(languageCode2Key, l2);
  }

  static String getLanguageCode2({required String key}) {
    return Global.storage.read(key) ?? 'US';
  }
}