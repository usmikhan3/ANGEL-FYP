import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzato/helpers/footer.dart';
import 'package:pizzato/helpers/headers.dart';
import 'package:pizzato/helpers/middle.dart';
import 'package:pizzato/screens/splash_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Headers()),
        ChangeNotifierProvider.value(value: MiddleHelpers()),
        ChangeNotifierProvider.value(value: ManageData()),
        ChangeNotifierProvider.value(value: Footers())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizzato',
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen()
      ),
    );
  }
}


