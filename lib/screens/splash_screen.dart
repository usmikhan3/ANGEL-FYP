import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/screens/home_screen.dart';
import 'package:pizzato/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userUid;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  Future getUid() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userUid = sharedPreferences.getString('uid');
    print(userUid);
  }

  @override
  void initState() {
    getUid().whenComplete((){
      Timer(Duration(seconds: 3),
              ()=>Navigator
              .pushReplacement(
              context,
              PageTransition(
                  child:userUid == null ? LoginScreen() : HomeScreen(),
                  type: PageTransitionType.leftToRightWithFade
              )
          )
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Lottie.asset("animations/slice.json"),
            ),
            RichText(
                text: TextSpan(
                    text: 'Piz',
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                    text: 'z',
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: 'ato',
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
