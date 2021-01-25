import 'package:flutter/material.dart';
import 'package:quizzler/user/create_quiz.dart';
import 'package:quizzler/user/create_survey.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                preferences.remove('user');
                bool value = await preferences.get('user');
                print(' user signout $value');
                Navigator.pop(context);
              })
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateSurvey()));
                },
                child: Text('Create Quiz'),
                color: Colors.tealAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, CreateSurvey.id);
                },
                child: Text('Create Survey'),
                color: Colors.tealAccent,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
