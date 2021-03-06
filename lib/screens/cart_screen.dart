import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/mini_views/maps.dart';
import 'package:pizzato/providers/authentication.dart';
import 'package:pizzato/providers/calculations.dart';

import 'package:pizzato/screens/Payment_type.dart';

import 'package:pizzato/screens/splash_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:pizzato/services/manageMaps.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            headerText(),
            cartData(),
            shippingDetails(context),
            billingData(),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.47668393 * SizeConfig.heightMultiplier),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomeScreen(),
                        type: PageTransitionType.rightToLeftWithFade));
              }),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.trashAlt,
                color: Colors.red,
              ),
              onPressed: () async {
                Provider.of<ManageData>(context, listen: false)
                    .deleteData(context);

                //Provider.of<Calculations>(context, listen: false).cartData = 0;
              })
        ],
      ),
    );
  }

  Widget headerText() {
    return Semantics(
      label: "YOUR CART ",
      child: Column(
        children: [
          ExcludeSemantics(
            excluding: true,
            child: Text(
              'Your',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 2.33160621 * SizeConfig.heightMultiplier),
            ),
          ),
          ExcludeSemantics(
            excluding: true,
            child: Text(
              'Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 3.88601036 * SizeConfig.heightMultiplier,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget cartData() {
    return SizedBox(
      height: 37.56476683 * SizeConfig.heightMultiplier,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('myOrders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset("animations/delivery.json"),
            );
          } else {
            return ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 5,
                            spreadRadius: 3),
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  height: 25.90673575 * SizeConfig.heightMultiplier,
                  width: 111.1111111 * SizeConfig.widthMultiplier,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ExcludeSemantics(
                        excluding: true,
                        child: SizedBox(
                          height: 24.61139896 * SizeConfig.heightMultiplier,
                          width: 41.66666666 * SizeConfig.widthMultiplier,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 2.22222222 * SizeConfig.widthMultiplier),
                            child: Image.network(
                              documentSnapshot.data()['image'],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2.22222222 * SizeConfig.widthMultiplier),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Semantics(
                              label: "${documentSnapshot.data()['name']}",
                              child: Text(
                                documentSnapshot.data()['name'],
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.590673575 *
                                        SizeConfig.textMultiplier),
                              ),
                            ),
                            Semantics(
                              label: "${documentSnapshot.data()['price']}",
                              child: Text(
                                'Price: \R\s. ${documentSnapshot.data()['price'].toString()}',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        1.8134715 * SizeConfig.textMultiplier),
                              ),
                            ),
                            Semantics(
                              label: "${documentSnapshot.data()['quantity']}",
                              child: Text(
                                  'Quantity : ${documentSnapshot.data()['quantity'].toString()}',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 1.8134715 *
                                          SizeConfig.textMultiplier)),
                            ),
                            CircleAvatar(
                              child: Semantics(
                                label: "${documentSnapshot.data()['size']}",
                                child: Text(
                                  documentSnapshot.data()['size'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList());
          }
        },
      ),
    );
  }

  Widget shippingDetails(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
      ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
      height: 16.8393782 * SizeConfig.heightMultiplier,
      width: 111.111111 * SizeConfig.widthMultiplier,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 2.59067357 * SizeConfig.heightMultiplier),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.locationArrow),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 2.2222222 * SizeConfig.widthMultiplier),
                      child: Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  69.44444444 * SizeConfig.widthMultiplier),
                          child: Semantics(
                              label:
                                  "${Provider.of<GenerateMaps>(context, listen: true).getMainAddress}",
                              child: Text(Provider.of<GenerateMaps>(context,
                                      listen: true)
                                  .getMainAddress))),
                    )
                  ],
                ),
                Semantics(
                  label: "Mark location on the map to confirm the address",
                  button: true,
                  child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Maps(),
                                type: PageTransitionType.bottomToTop));
                      }),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(EvaIcons.clock),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 2.2222222 * SizeConfig.widthMultiplier),
                    child: Container(
                        constraints: BoxConstraints(
                            maxWidth: 69.44444444 * SizeConfig.widthMultiplier),
                        child: Text("Home Delivery 3-4 days")),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: EdgeInsets.only(top: 1.55440414 * SizeConfig.heightMultiplier),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 5, spreadRadius: 3)
        ], borderRadius: BorderRadius.circular(40.0), color: Colors.white),
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: "SubTotal",
                  child: Text(
                    'subtotal: ',
                    style: TextStyle(
                        fontSize: 2.0725388 * SizeConfig.textMultiplier,
                        color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Semantics(
                      label: "Rupees",
                      child: Text(
                        "Rs. ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 2.0725388 * SizeConfig.textMultiplier),
                      ),
                    ),
                    Text("1350.0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 2.0725388 * SizeConfig.textMultiplier,
                        ))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: "Delivery Charges",
                  child: Text(
                    'Delivery charges: ',
                    style: TextStyle(
                        fontSize: 2.0725388 * SizeConfig.textMultiplier,
                        color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Semantics(
                      label: "Rupees",
                      child: Text(
                        "Rs. ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 2.0725388 * SizeConfig.textMultiplier),
                      ),
                    ),
                    Text("30.0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 2.0725388 * SizeConfig.textMultiplier,
                        ))
                  ],
                )
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 2.222222 * SizeConfig.widthMultiplier),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Semantics(
                    label: "Total",
                    child: Text(
                      'Total: ',
                      style: TextStyle(
                          fontSize: 2.3316062 * SizeConfig.textMultiplier,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Semantics(
                        label: "Rupees",
                        child: Text(
                          "Rs. ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 2.0725388 * SizeConfig.textMultiplier),
                        ),
                      ),
                      Text("330.00",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 2.0725388 * SizeConfig.textMultiplier,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Authentication>(context, listen: false).getUid == null
                ? print(' we are getting user id: $userUid')
                : print(
                    Provider.of<Authentication>(context, listen: false).getUid);
            Navigator.push(
                context,
                PageTransition(
                    child: PaymentMethod(), type: PageTransitionType.fade));
          },
          child: Semantics(
            label: "Place your order",
            button: true,
            child: Container(
              width: 69.444444444 * SizeConfig.widthMultiplier,
              height: 6.4766839378 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  color: Colors.red.shade500,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  'Place Order',
                  style: TextStyle(
                    fontSize: 2.590673575 * SizeConfig.textMultiplier,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
