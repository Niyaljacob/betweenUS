import 'dart:math';
import 'package:get/get.dart';
import '../providers/firebase_provider.dart';
import 'auth_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConnectRepository {
  final FirebaseProvider _provider = FirebaseProvider();
  final AuthRepository _auth = AuthRepository();
  String get userId => _auth.userId;

  String generateCode() {
    final chars = dotenv.env['CODE_CHARS']!;
    final length = int.parse(dotenv.env['CODE_LENGTH']!);

    final rand = Random();

    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rand.nextInt(chars.length)),
      ),
    );
  }

  Future<String> createCode() async {
    final userId = _auth.userId;
    final code = generateCode();

    await _provider.createInvite(code, userId);
    return code;
  }

  Future<void> joinCode(String code) async {
    final doc = await _provider.getInvite(code);

    if (!doc.exists) {
      Get.snackbar("Error", "Invalid code");
      return;
    }

    final partnerId = doc['userId'];
    final currentUserId = _auth.userId;

    await _provider.saveConnection(currentUserId, partnerId);
    await _provider.saveConnection(partnerId, currentUserId);

    await _provider.deleteInvite(code);

    Get.snackbar("Success", "Connected!");
  }
}
