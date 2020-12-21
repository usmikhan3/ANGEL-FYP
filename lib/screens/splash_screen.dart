import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/screens/home_screen.dart';
import 'package:pizzato/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userUid;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getUid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userUid = sharedPreferences.getString('uid');
    print(userUid);
  }

  @override
  void initState() {
    getUid().whenComplete(() {
      Timer(
          Duration(seconds: 5),
<<<<<<< HEAD
              () => Navigator.pushReplacement(
=======
          () => Navigator.pushReplacement(
>>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
              context,
              PageTransition(
                  child: userUid == null ? LoginScreen() : HomeScreen(),
                  type: PageTransitionType.leftToRightWithFade)));
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   height: 200,
                //   width: 100,
                //   child: Lottie.asset("animations/shoppingbag.json"),
                // ),
                Container(
                  height: 38.86010 * SizeConfig.heightMultiplier,
                  width: 83.3333333 * SizeConfig.widthMultiplier,
                  child: Lottie.asset("animations/angel.json"),
                ),
              ],
            ),
            RichText(
                text: TextSpan(
                    text: 'An',
                    style: TextStyle(
                        fontSize: 7.25388601 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
<<<<<<< HEAD
                      TextSpan(
                        text: 'g',
                        style: TextStyle(
                            fontSize: 7.25388601 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      TextSpan(
                        text: 'el',
                        style: TextStyle(
                            fontSize: 7.25388601 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ]))
=======
                  TextSpan(
                    text: 'g',
                    style: TextStyle(
                        fontSize: 7.25388601 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  TextSpan(
                    text: 'el',
                    style: TextStyle(
                        fontSize: 7.25388601 * SizeConfig.textMultiplier,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ]))
>>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
          ],
        ),
      ),
    );
  }
}
