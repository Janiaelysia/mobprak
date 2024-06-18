import 'package:activewell_new/pages/profiles/edit_profile_screen.dart';
import 'package:activewell_new/pages/sign_in.dart';
import 'package:activewell_new/screens/auth/edit_password_screen.dart';
import 'package:activewell_new/services/bmi_service.dart';
import 'package:activewell_new/services/user_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userProvider);

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
                  userData.imageUrl != null && userData.imageUrl!.isNotEmpty
                      ? Container(
                          width: 135,
                          height: 135,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 237, 237, 237),
                                width: 7),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(userData.imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          width: 135,
                          height: 135,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 237, 237, 237),
                                width: 7),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profil.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      '${userData.fname} ${userData.lname}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      userData.email,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
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
                              builder: (context) => EditProfileScreen(),
                            ),
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
                      // SizedBox(height: 10),
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => AboutPage()),
                      //     );
                      //   },
                      //   tileColor: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(10))),
                      //   leading: Icon(
                      //     Icons.info,
                      //     color: Colors.grey,
                      //   ),
                      //   title: Text("About Us"),
                      // ),
                      SizedBox(height: 10),
                      //Edit password
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditPasswordScreen()),
                          );
                        },
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        leading: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        title: Text("Change Password"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        onTap: () async {
                          ref.read(userProvider.notifier).clear();
                          ref.read(bmiprovider.notifier).clear();
                          await FirebaseAuth.instance.signOut();
                          if (!mounted) {
                            return;
                          }
                          Navigator.of(context).pushReplacement(
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
