import 'package:activewell_new/pages/about.dart';
import 'package:activewell_new/pages/settings.dart';
import 'package:activewell_new/pages/sign_in.dart';
import 'package:activewell_new/pages/sign_up.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 237, 86, 59),
      ),

      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(top: 30, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("images/profil.png"),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Putri",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    child: Text(
                      "Syafira",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
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
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                leading: Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                title: Text("About Us"),
              ),

              SizedBox(height: 10),

              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                leading: Icon(
                  Icons.login,
                  color: Colors.grey,
                ),
                title: Text("Sign in"),
              ),

              // SizedBox(height: 10), // Adding space between items

              // ListTile(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => SignUpPage()),
              //     );
              //   },
              //   tileColor: Colors.white,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(12))),
              //   title: Text("Sign up"),
              // ),

              // ListTile(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => SignInPage()),
              //     );
              //   },
              //   tileColor: Colors.white,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(12))),
              //   title: Text("Sign out"),
              // ),
            ],
          ),
        )
      ]),
    );
  }
}
