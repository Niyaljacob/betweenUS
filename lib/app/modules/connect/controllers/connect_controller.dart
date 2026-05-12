import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:between_us/app/routes/app_routes.dart';
import 'package:between_us/data/repositories/connect_repository.dart';
import 'package:get/get.dart';

class ConnectController extends GetxController {
  final ConnectRepository _repo = ConnectRepository();

  final generatedCode = ''.obs;
  final enteredCode = ''.obs;

  final userId = FirebaseAuth.instance.currentUser!.uid;

  bool isNavigated = false;

  @override
  void onInit() {
    super.onInit();
    listenForConnection(); // 🔥 important
  }

  void createCode() async {
    print("User: ${_repo.userId}");

    final code = await _repo.createCode();

    print("Generated: $code");

    generatedCode.value = code;
  }

  void joinCode() async {
    await _repo.joinCode(enteredCode.value.trim());
    // ❌ REMOVE manual navigation
    // Get.offAllNamed(Routes.HOME);
  }

  void listenForConnection() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen((doc) {
          if (!isNavigated && doc.exists && doc.data()?['partnerId'] != null) {
            isNavigated = true;

            print("Connected! Navigating to Home");

            Get.offAllNamed(Routes.HOME);
          }
        });
  }
}
