import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> register({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? userId = userCredential.user?.uid;
      String? mail = userCredential.user?.email;

      final docUser = firestore.collection('users').doc(userId);

      docUser.set({
        'userId': userId,
        'email': mail,
        'name': 'null',
        'alamat': 'null',
        'hp': 'null',
        'birth': '',
        'member': 'Gratis',
      });

      return 'true';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user?.uid ?? '';
      String mail = userCredential.user?.email ?? '';

      return 'true';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> getName() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    String? userId = auth.currentUser?.uid;

    final docRef = firestore.collection('users').doc(userId);
    DocumentSnapshot doc = await docRef.get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      return data['name'];
    } else {
      return 'null';
    }
  }

  Future<String?> getStatus() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    String? userId = auth.currentUser?.uid;

    final docRef = firestore.collection('users').doc(userId);
    DocumentSnapshot doc = await docRef.get();

    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      return data['member'];
    } else {
      return 'Gratis';
    }
  }
}
