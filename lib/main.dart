import 'package:activewell_new/pages/account.dart';
import 'package:activewell_new/pages/favorite.dart';
import 'package:activewell_new/pages/journey.dart';
import 'package:activewell_new/pages/program.dart';
import 'package:activewell_new/pages/recipe.dart';
import 'package:activewell_new/pages/sign_in.dart';
import 'package:activewell_new/pages/sign_up.dart';
import 'package:activewell_new/pages/tools.dart';
import 'package:activewell_new/pages/videos.dart';
import 'package:activewell_new/screens/home_screen.dart';
import 'package:activewell_new/screens/splash_screen.dart';
import 'package:activewell_new/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/welcome": (context) =>
            WelcomeScreen(), //setelah splash (kalau belum pernah login dan ga centang remember me)
        "/homescreen": (context) => HomeScreen(),
        "/signin": (context) => SignInPage(),
        "/signup": (context) => SignUpPage(),
        "/account": (context) => AccountPage(),
        '/journey': (context) => JourneyPage(),
        '/programs': (context) => ProgramPage(),
        '/videos': (context) => VideosPage(),
        '/recipes': (context) => RecipesPage(),
        '/tools': (context) => ToolsPage(),
        '/favorites': (context) => FavoritePage(),
        '/splash': (context) => SplashScreen(),
      },
      initialRoute: "/welcome",
    );
  }
}
