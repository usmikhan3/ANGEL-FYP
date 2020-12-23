import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/screens/cart_screen.dart';

class Footers extends ChangeNotifier{

  Widget floatingActionButton(BuildContext context){
    return Semantics(
      label: "Navigate to Cart",
      button: true,
      child: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: CartScreen(),
                  type: PageTransitionType.rightToLeftWithFade));
        },
        child: Icon(EvaIcons.shoppingBag),
      ),
    );
  }


}