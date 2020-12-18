import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/mini_views/maps.dart';
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
      padding: const EdgeInsets.only(top: 50.0),
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
                FontAwesomeIcons.trash,
                color: Colors.red,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget headerText() {
    return Column(
      children: [
        Text(
          'Your',
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
        Text(
          'Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget cartData() {
    return SizedBox(
      height: 300,
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
                        spreadRadius: 3
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25)
                  ),
                  height: 200,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(

                        height: 190,
                        width: 190,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Image.network(documentSnapshot.data()['image'],),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              documentSnapshot.data()['name'],
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            Text(
                              'Price: \R\s. ${documentSnapshot.data()['price'].toString()}',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            Text(
                              'Onion: \R\s. ${documentSnapshot.data()['onion'].toString()}',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            Text(
                              'Beacon: \R\s. ${documentSnapshot.data()['beacon'].toString()}',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            Text(
                              'Cheese: \R\s. ${documentSnapshot.data()['cheese'].toString()}',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                            CircleAvatar(
                              child: Text(documentSnapshot.data()['size'], style: TextStyle(
                                color: Colors.white
                              ),),
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
      height: 130.0,
      width: 400.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(FontAwesomeIcons.locationArrow),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          constraints: BoxConstraints(maxWidth: 250.0),
                          child: Text(Provider.of<GenerateMaps>(context,listen: true).getMainAddress)),
                    )
                  ],
                ),
                IconButton(icon: Icon(Icons.edit), onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: Maps(),
                          type: PageTransitionType.bottomToTop));
                })
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
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        constraints: BoxConstraints(maxWidth: 250.0),
                        child: Text("6PM - 8PM")),
                  )
                ],
              ),
              IconButton(icon: Icon(Icons.edit), onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Widget billingData() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
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
                Text(
                  'subtotal: ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      "Rs. ",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text("300.0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ))
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Delivery charges: ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      "Rs. ",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text("30.0",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ))
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total: ',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs. ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Text("330.00",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: CartScreen(), type: PageTransitionType.bottomToTop));
          },
          child: Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Place Order',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
