import 'package:flutter/material.dart';
import 'package:quizzler/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizzler/user/create_survey.dart';
import 'package:quizzler/user/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String number;

  bool checkvalue = false;
  Future userData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    checkvalue = await preferences.containsKey('user');
    print('uservalue $checkvalue');
    if (checkvalue == true) {
      Navigator.pushNamed(context, HomePage.id);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: KTextField,
              onSubmitted: (String value) {
                number = value;
              },
            ),
            RaisedButton(
              onPressed: () {
                print(number);
                String code;
                try {
                  _auth.verifyPhoneNumber(
                      phoneNumber: number,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        Navigator.of(context).pop();
                        final user =
                            await _auth.signInWithCredential(credential);
                        if (user != null) {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setBool('user', true);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          print('page not show');
                        }
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        print('error $e');
                      },
                      codeSent: (String verificationId, int resendToken) async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Enter Code to verify Number'),
                                content: TextField(
                                  onSubmitted: (String value) {
                                    code = value;
                                  },
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        PhoneAuthCredential
                                            phoneAuthCredential =
                                            PhoneAuthProvider.credential(
                                                verificationId: verificationId,
                                                smsCode: code);
                                        // Sign the user in (or link) with the credential
                                        final user =
                                            await _auth.signInWithCredential(
                                                phoneAuthCredential);
                                        if (user != null) {
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setBool('user', true);
                                          bool value =
                                              await preferences.get('user');
                                          print(' user sign in $value');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                        } else {
                                          print('page not show');
                                        }
                                      },
                                      child: Text('Verify'))
                                ],
                              );
                            });
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        // Auto-resolution timed out...
                      },
                      timeout: Duration(seconds: 60));
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
