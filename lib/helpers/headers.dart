import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/screens/all_products.dart';
import 'package:pizzato/screens/casual_products.dart';

import 'package:pizzato/screens/login_screen.dart';
import 'package:pizzato/screens/men_products.dart';
import 'package:pizzato/screens/shoes_products.dart';
import 'package:pizzato/screens/women_products.dart';
import 'package:pizzato/services/manageMaps.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Headers extends ChangeNotifier {
  Widget appBar(BuildContext context) {
    return Semantics(
      label: "Top AppBar of Home Page",
      child: AppBar(
        //backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(),
        elevation: 0.0,
        actions: [
          Semantics(
            label: "Log Out",
            button: true,
            child: IconButton(icon: Icon(EvaIcons.logOutOutline), onPressed: ()async{
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('uid');
              Navigator.pushReplacement(context, PageTransition
                (child: LoginScreen(),
                  type: PageTransitionType.leftToRightWithFade));
            }),
          ),
        ],
        title: Semantics(
          label: "Home Page",
          child: Text(
            "Home",
            style: TextStyle(
                color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),),
        )),
    );}

//class Headers extends ChangeNotifier{

//   Widget appBar(BuildContext context){
//     return Padding(
//       padding: EdgeInsets.only(top:6.4766839 * SizeConfig.heightMultiplier) ,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           IconButton(icon: Icon(EvaIcons.logOutOutline), onPressed: ()async{
//             SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//             sharedPreferences.remove('uid');
//             Navigator.pushReplacement(context, PageTransition
//               (child: LoginScreen(),
//                 type: PageTransitionType.leftToRightWithFade));
//           }),
//           Row(
//             children: [
//               Icon(FontAwesomeIcons.locationArrow, size: 1.813471 * SizeConfig.heightMultiplier,),
//               Container(
//                 constraints: BoxConstraints(maxWidth: 63.88888 * SizeConfig.widthMultiplier),
//                 child: Text(finalAddress, style: TextStyle(
//                   color: Colors.grey.shade600, fontSize: 1.55440 * SizeConfig.textMultiplier,fontWeight: FontWeight.w600
//                 ),
//                 ),
//               ),
//               IconButton(icon: Icon(FontAwesomeIcons.search, color: Colors.black,), onPressed: (){}),
//             ],
//           ),
//         ],
// >>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
//       ),
//       centerTitle: true,
//     );
//   }

  Widget headerText() {
    return Container(
      constraints: BoxConstraints(maxWidth: 293),
      child: Semantics(
        label: "What would you like to eat?`",
        child: RichText(
          text: TextSpan(
              text: 'What would you like ',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 3.756476 * SizeConfig.textMultiplier,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'to buy?',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 4.958549 * SizeConfig.textMultiplier,
                      color: Colors.black),
                )
              ]),


        ),
      ),

      );
  }

  Widget headerMenu(BuildContext context) {
    return Padding(

      padding: EdgeInsets.only(top: 2.590673 * SizeConfig.heightMultiplier, left: 10, right: 10 ),


      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Semantics(
          label: "Categories Menu",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(

                onTap: () {
                  Navigator.push(context, PageTransition(child: AllProducts(), type: PageTransitionType.bottomToTop));
                },
                child: Semantics(
                  label: "All Category",
                  button: true,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.redAccent, blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.grey.shade100),
                    height: 5.18134715 * SizeConfig.heightMultiplier,
                    width: 27.777777 * SizeConfig.widthMultiplier,
                    child: Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4.166666 * SizeConfig.widthMultiplier,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(child: MenProducts(), type: PageTransitionType.bottomToTop));
                },
                child: Semantics(
                  label: "Men Category",
                  button: true,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.blue, blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.grey.shade100),
                    height: 5.18134715 * SizeConfig.heightMultiplier,
                    width: 27.777777 * SizeConfig.widthMultiplier,
                    child: Center(
                      child: Text(
                        'Men',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4.166666 * SizeConfig.widthMultiplier,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(child: WomenProducts(), type: PageTransitionType.bottomToTop));
                },
                child: Semantics(
                  label: "Women Category",
                  button: true,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.green, blurRadius: 10)],
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.grey.shade100),
                    height: 5.18134715 * SizeConfig.heightMultiplier,
                    width: 27.777777 * SizeConfig.widthMultiplier,
                    child: Center(
                      child: Text(
                        'Women',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4.166666 * SizeConfig.widthMultiplier,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(child: CasualProducts(), type: PageTransitionType.bottomToTop));
                },
                child: Semantics(
                  label: "Casual category",
                  button: true,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.yellow, blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.grey.shade100),
                    height: 5.18134715 * SizeConfig.heightMultiplier,
                    width: 27.777777 * SizeConfig.widthMultiplier,
                    child: Center(
                      child: Text(
                        'Casual',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
              width: 4.166666 * SizeConfig.widthMultiplier,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, PageTransition(child: ShoesProducts(), type: PageTransitionType.bottomToTop));
                },
                child: Semantics(
                  label: "Shoes category",
                  button: true,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.purple, blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        color: Colors.grey.shade100),
                    height: 5.18134715 * SizeConfig.heightMultiplier,
                    width: 27.777777 * SizeConfig.widthMultiplier,
                    child: Center(
                      child: Text(
                        'Shoes',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),))





                  ),
                ))],
          ),
        ),
      ),
    );
  }
}
