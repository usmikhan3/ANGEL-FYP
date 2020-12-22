import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizzato/helpers/footer.dart';
import 'package:pizzato/helpers/headers.dart';
import 'package:pizzato/helpers/middle.dart';
import 'package:pizzato/providers/authentication.dart';
import 'package:pizzato/providers/calculations.dart';
import 'package:pizzato/screens/splash_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:pizzato/services/manageMaps.dart';
import 'package:provider/provider.dart';

import 'helpers/size_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider.value(value: Footers()),
        ChangeNotifierProvider.value(value: GenerateMaps()),
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: Calculations())
      ],
      child: LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
            builder: (context, orientation){
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                  debugShowCheckedModeBanner: false,

                  title: 'Angel',
                  theme: ThemeData(
                    //canvasColor: Colors.transparent,
                    fontFamily: 'Monteserrat',

                    //fontFamily: 'Figno',

                    primarySwatch: Colors.red,
                    primaryColor: Colors.redAccent,
                    //visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  home: SplashScreen()
              );
            },
          );

        },
      ),
    );
  }
}


