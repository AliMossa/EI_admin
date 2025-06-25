import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path_provider/path_provider.dart';

class SafeStorage {
  static final _key = encrypt.Key.fromUtf8(
    'N8v@Z3!pL9q#15eW5u^R0fJkM6x&T2bQ',
  ); // 32 chars
  static final _iv = encrypt.IV.fromLength(16);

  static Future<void> write(String key, String value) async {
    final encrypter = encrypt.Encrypter(
      encrypt.AES(_key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'),
    );
    final encrypted = encrypter.encrypt(value, iv: _iv);
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/$key.secure');
    await file.writeAsString(encrypted.base64);
  }

  static Future<String?> read(String key) async {
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/$key.secure');

    if (!await file.exists()) return null;

    final encryptedBase64 = await file.readAsString();
    final encrypted = encrypt.Encrypted.fromBase64(encryptedBase64);

    final encrypter = encrypt.Encrypter(
      encrypt.AES(_key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'),
    );
    try {
      return encrypter.decrypt(encrypted, iv: _iv);
    } catch (e) {
      return null;
    }
  }

  static Future<void> clearAllData() async {
    final dir = await getApplicationSupportDirectory();
    final files = dir.listSync(); // List all files in the directory

    for (var file in files) {
      if (file is File) {
        await file.delete(); // Delete each file
      }
    }
  }
}
