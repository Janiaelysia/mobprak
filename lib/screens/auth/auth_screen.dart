import 'package:activewell_new/pages/sign_in.dart';
import 'package:activewell_new/screens/home_screen.dart';
import 'package:activewell_new/services/bmi_service.dart';
import 'package:activewell_new/services/user_notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final userCredential = snapshot.data;
            return FutureBuilder<void>(
              future: _loadUserData(ref, userCredential!),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (userSnapshot.hasError) {
                  return Center(child: Text('Error loading user data'));
                } else {
                  return HomeScreen();
                }
              },
            );
          } else {
            return SignInPage();
          }
        },
      ),
    );
  }

  Future<void> _loadUserData(WidgetRef ref, User userCredential) async {
    // Mengambil data user dari Firestore
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.uid)
        .get();

    final userData = userDoc.data();
    if (userData != null) {
      ref.read(userProvider.notifier).setUser(
            uid: userCredential.uid,
            fname: userData['fname'],
            lname: userData['lname'],
            email: userData['email'],
            imageUrl: userData['imageUrl'],
          );

      // Mengambil track record terakhir dari user
      await ref.read(bmiprovider.notifier).loadRecords();
    } else {
      ref.read(userProvider.notifier).clear();
      ref.read(bmiprovider.notifier).clear();
    }
  }
}
