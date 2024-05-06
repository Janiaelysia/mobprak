// ignore_for_file: prefer_const_constructors

import 'package:activewell_new/pages/sign_in.dart';
import 'package:activewell_new/screens/home_screen.dart';
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
          if (snapshot.hasData) {
            final userCredential = snapshot.data;
            FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential!.uid)
                .get()
                .then(
                  (userData) => ref.watch(userProvider.notifier).setUser(
                        uid: userCredential.uid,
                        fname: userData.data()!['fname'],
                        lname: userData.data()!['lname'],
                        email: userData.data()!['email'],
                        imageUrl: userData.data()!['image_url'],
                      ),
                );
            return HomeScreen();
          } else {
            return SignInPage();
          }
        },
      ),
    );
  }
}
