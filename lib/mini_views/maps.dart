import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/screens/cart_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:pizzato/services/manageMaps.dart';
import 'package:provider/provider.dart';


class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Provider
                .of<GenerateMaps>(context, listen: false)
                .fetchMaps(),
            Positioned(
                top:720,
                left: 50,
                child: Container(
                  color: Colors.white,
                  height: 80.0,
                  width: 300,
                  child: Text(Provider.of<GenerateMaps>(context,listen: true).getMainAddress),
                )
            ),
            Positioned(
<<<<<<< HEAD
                top:50,
=======
              top:50,
>>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: CartScreen(),
                            type: PageTransitionType.fade));
                  },
                )
            )
          ],

        ),
      ),
    );
  }
}
