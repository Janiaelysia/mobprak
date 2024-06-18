import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _userData = FirebaseFirestore.instance;
  // final User? _currentUser = FirebaseAuth.instance.currentUser;

  // get current user
  User? get currentUser => _auth.currentUser;

  // Registering User
  Future<UserCredential> registerUser({
    required String email,
    required String password,
    required String fname,
    required String lname,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await createUserDocument(userCredential, fname, lname);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Create user data
  Future<void> createUserDocument(
      UserCredential? userCredential, String fname, lname) async {
    if (userCredential != null && userCredential.user != null) {
      await _userData.collection("users").doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'fname': fname,
        'lname': lname,
      });
    }
  }

  // Login
  Future<UserCredential> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Log Out
  Future<void> logOutUser() async {
    await _auth.signOut();
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // get user data
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    try {
      final user =
          await _userData.collection('users').doc(currentUser!.uid).get();
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // change profile picture

  Future<void> updateUserProfile({
    required String uid,
    required String name,
    required String phone,
    required String address,
    String? imageUrl,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'name': name,
        'phone': phone,
        'address': address,
        'imageUrl': imageUrl ?? '',
      });
    } catch (e) {
      print('Error updating user profile: $e');
      rethrow;
    }
  }

  //change password

  Future<void> changePassword(String newPassword) async {
    currentUser?.updatePassword(newPassword);
  }

  //get user name by email and return as string
  Future<String> getUserName(String email) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _userData.collection("users").doc().get();
    final String username = snapshot.get('fname') + " " + snapshot.get('lname');
    return username;
  }
}
