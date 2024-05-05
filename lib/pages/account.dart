import 'package:activewell_new/pages/about.dart';
import 'package:activewell_new/pages/settings.dart';
import 'package:activewell_new/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 237, 237, 237), width: 7),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/user_profile.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      currentUser != null ? currentUser.email ?? '' : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        },
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        leading: Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                        title: Text("Settings"),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()),
                          );
                        },
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        leading: Icon(
                          Icons.info,
                          color: Colors.grey,
                        ),
                        title: Text("About Us"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        },
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        leading: Icon(
                          Icons.login,
                          color: Colors.grey,
                        ),
                        title: Text("Sign in"),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        },
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        leading: Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                        title: Text("Sign out"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => SizedBox(height: 7);
}
