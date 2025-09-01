import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:hive/hive.dart';

class SafeStorage {
  static String _tableName = 'myBox';

  static Future<void> write(String key, String value) async {
    final box = await Hive.openBox(_tableName);

    //String encrypted = EncryptionHelper.encryptText(value);
    box.put(key, value);
  }

  static Future<String?> read(String key) async {
    final box = await Hive.openBox(_tableName);
    String? encryptedStored = box.get(key);
    if (encryptedStored != null) {
      return encryptedStored;
    }
    return null;
  }

  static Future<void> clearAllData() async {
    final box = await Hive.openBox(_tableName);
    await box.clear();
  }
}

class EncryptionHelper {
  static final _key = encrypt.Key.fromUtf8(
    'my32lengthsupersecretnooneknows1',
  ); // 32 chars
  static final _iv = encrypt.IV.fromLength(
    16,
  ); // You can use a secure IV if needed

  static String encryptText(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base64;
  }

  static String decryptText(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: _iv);
    return decrypted;
  }
}
