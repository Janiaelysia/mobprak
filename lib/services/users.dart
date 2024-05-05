// import 'package:activewell_new/pages/home.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class UserManagement {
//   storeNewUser(user, context) async {
//     var firebaseUser = await FirebaseAuth.instance.currentUser;
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(firebaseUser!.uid)
//         .setData({'email': user.email, 'uid': user.uid})
//         .then((value) => Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomePage())))
//         .catchError((e) {
//           print(e);
//         });
//   }
// }

// Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
//   final currentUser = FirebaseAuth.instance.currentUser;
//   return await FirebaseFirestore.instance
//       .collection("users")
//       .doc(currentUser!.uid)
//       .get();
// }
