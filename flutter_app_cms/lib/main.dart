import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_cms/screen/SetupProfile/SetupProfile.dart';
import 'package:flutter_app_cms/screen/chatbox/home_screen.dart';
import 'package:flutter_app_cms/screen/demotesst.dart';
import 'package:flutter_app_cms/screen/login/Login.dart';
import 'package:flutter_app_cms/screen/login/LoginFirebase.dart';
import 'package:flutter_app_cms/screen/mappage/MapGisHcm.dart';
import 'package:flutter_app_cms/screen/mappage/MapGoogle.dart';
import 'package:flutter_app_cms/screen/mappage/MapList.dart';
import 'package:flutter_app_cms/screen/mappage/MapPage.dart';
import 'package:flutter_app_cms/screen/mappage/MapTest.dart';
import 'package:flutter_app_cms/screen/register/Register.dart';
import 'package:flutter_app_cms/screen/home/Home.dart';
import 'package:flutter_app_cms/screen/details/Details.dart';

// void main() {
//   runApp(MaterialApp(home: HomePage()));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/homemessenger': (context) => HomeScreen(),
        '/login': (context) => LoginPage(),
        '/loginfirebase': (context) => LoginFirebasePage(),
        '/register': (context) => RegisterPage(),
        '/details': (context) => DetailsPage(),
        '/stprofile': (context) => SetupProfile(),
        // '/mappage': (context) => MapListPage(),
        '/maplist': (context) => MapListPage(),
        '/maptest': (context) => MapTest(),
        '/mapgoogle': (context) => MapGoogle(),
        '/mapgishcm': (context) => GisHcm(),
      },
    );
  }
}
