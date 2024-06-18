import 'package:activewell_new/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600 ||
        MediaQuery.of(context).size.height < 800;

    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                // layar putih
                Container(
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                ),

                // kotak abu atas
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height /
                      (isSmallScreen ? 1.8 : 1.677),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 247, 247),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: Image.asset(
                      "assets/images/welcome.jpeg",
                      scale: isSmallScreen ? 1.5 : 1.2,
                    ),
                  ),
                ),

                //kotak abu bawah
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height /
                        (isSmallScreen ? 2.2 : 2.333),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 247, 247),
                    ),
                  ),
                ),
                //kotak putih nimpa kotak abu bawah
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height /
                        (isSmallScreen ? 2.2 : 2.333),
                    padding: EdgeInsets.only(top: 40, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Your Fitness Awaits",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 25 : 35,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: isSmallScreen ? 20 : 40),
                          child: Text(
                            "Where Progress Matters",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 17 : 24,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 65 : 95),

                        //Tombol Get Started
                        Material(
                          color: Color.fromARGB(255, 237, 86, 59),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: isSmallScreen ? 50 : 90),
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
