import 'package:activewell_new/pages/account.dart';
import 'package:activewell_new/pages/favorite.dart';
import 'package:activewell_new/pages/journey.dart';
import 'package:activewell_new/pages/program.dart';
import 'package:activewell_new/pages/recipes.dart';
import 'package:activewell_new/pages/recipes/detail_meal1.dart';
import 'package:activewell_new/pages/recipes/detail_meal2.dart';
import 'package:activewell_new/pages/recipes/detail_meal3.dart';
import 'package:activewell_new/pages/recipes/detail_meal4.dart';
import 'package:activewell_new/pages/recipes/detail_beverage1.dart';
import 'package:activewell_new/pages/recipes/detail_beverage2.dart';
import 'package:activewell_new/pages/recipes/detail_beverage3.dart';
import 'package:activewell_new/pages/recipes/detail_beverage4.dart';
import 'package:activewell_new/pages/recipes/detail_snack1.dart';
import 'package:activewell_new/pages/recipes/detail_snack2.dart';
import 'package:activewell_new/pages/recipes/detail_snack3.dart';
import 'package:activewell_new/pages/recipes/detail_snack4.dart';
import 'package:activewell_new/pages/sign_in.dart';
import 'package:activewell_new/pages/sign_up.dart';
import 'package:activewell_new/pages/tools.dart';
import 'package:activewell_new/pages/videos.dart';
import 'package:activewell_new/screens/home_screen.dart';
import 'package:activewell_new/screens/splash_screen.dart';
import 'package:activewell_new/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return ProviderScope(
      child: MaterialApp(
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

          //recipe
          '/detail_meal1': (context) => detailMeal1(),
          '/detail_meal2': (context) => detailMeal2(),
          '/detail_meal3': (context) => detailMeal3(),
          '/detail_meal4': (context) => detailMeal4(),
          '/detail_beverage1': (context) => detailBeverage1(),
          '/detail_beverage2': (context) => detailBeverage2(),
          '/detail_beverage3': (context) => detailBeverage3(),
          '/detail_beverage4': (context) => detailBeverage4(),
          '/detail_snack1': (context) => detailSnack1(),
          '/detail_snack2': (context) => detailSnack2(),
          '/detail_snack3': (context) => detailSnack3(),
          '/detail_snack4': (context) => detailSnack4(),
        },
        initialRoute: "/splash",
      ),
    );
  }
}
