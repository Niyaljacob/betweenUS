import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createInvite(String code, String userId) async {
    await _db.collection('invites').doc(code).set({
      'userId': userId,
      'createdAt': DateTime.now(),
    });
  }

  Future<DocumentSnapshot> getInvite(String code) {
    return _db.collection('invites').doc(code).get();
  }

  Future<void> deleteInvite(String code) {
    return _db.collection('invites').doc(code).delete();
  }

  Future<void> saveConnection(String userId, String partnerId) async {
    await _db.collection('users').doc(userId).set({
      'partnerId': partnerId,
    }, SetOptions(merge: true));
  }

  Future<DocumentSnapshot> getUser(String userId) {
    return _db.collection('users').doc(userId).get();
  }
}
