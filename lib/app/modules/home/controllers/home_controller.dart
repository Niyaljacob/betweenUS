import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final userId = FirebaseAuth.instance.currentUser!.uid;
  final partnerId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPartner();
  }

  Future<void> fetchPartner() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (doc.exists) {
      partnerId.value = doc['partnerId'];
    }
  }
}
