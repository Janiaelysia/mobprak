import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _userData = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  // get current user
  User? get currentUser => _currentUser;

  // Registering User
  Future<UserCredential> registerUser(
    String email,
    password,
    fname,
    lname,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      createUserDocument(userCredential, fname, lname);
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
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'fname': fname,
        'lname': lname,
      });
    }
  }

  // Login
  Future<UserCredential> loginUser(String email, password) async {
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
  void logOutUser() {
    _auth.signOut();
  }

  // get user data
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await _userData.collection("users").doc(_currentUser!.uid).get();
  }

  // change profile picture

  Future<void> changeProfilePict(File file, String uid) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('users/$uid.jpg');
      final imageBytes = await file.readAsBytes();
      await imageRef.putData(imageBytes);
    } catch (e) {
      print("Error: $e");
    }
  }

  // read profile picture
  Future<String?> getPict() async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('users/' + _currentUser!.uid + '.jpg');
      return imageRef.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }

  // edit data

  Future<void> changeUserData(String field, newValue) async {
    await _userData.collection('users').doc(_currentUser!.uid).update({
      field: newValue,
    });
  }

  //change password

  Future<void> changePassword(String newPassword) async {
    _currentUser?.updatePassword(newPassword);
  }

  //get user name by email and return as string
  Future<String> getUserName(String email) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _userData.collection("users").doc().get();
    final String username = snapshot.get('fname') + " " + snapshot.get('lname');
    return username;
  }
}