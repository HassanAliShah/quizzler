import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/login_page.dart';
import 'package:quizzler/user/create_quiz.dart';
import 'package:quizzler/user/create_survey.dart';
import 'package:quizzler/user/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        CreateQuiz.id: (context) => CreateQuiz(),
        CreateSurvey.id: (context) => CreateSurvey(),
      },
    );
  }
}
