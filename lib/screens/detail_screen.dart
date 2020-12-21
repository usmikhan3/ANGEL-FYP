import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/main.dart';
import 'package:pizzato/providers/calculations.dart';
import 'package:pizzato/screens/cart_screen.dart';
import 'package:pizzato/screens/home_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;

  const DetailScreen({this.queryDocumentSnapshot});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cheeseValue = 0;
  int beaconValue = 0;
  int onionValue = 0;
  int totalItems = 0;
  int cartData = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(context),
          pizzaImage(),
          middleData(),
          footerDetails(),
        ],
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.4766839 * SizeConfig.heightMultiplier),
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
              onPressed: () {
                Provider.of<Calculations>(context, listen: false).removeAllData();
              })
        ],
      ),
    );
  }

  Widget pizzaImage() {
    return Center(
      child: SizedBox(
        height: 36.26943 * SizeConfig.heightMultiplier,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
          decoration: BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }

  Widget middleData() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow.shade700,
              size: 2.590673 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.0362694 * SizeConfig.widthMultiplier),
              child: Text(
                widget.queryDocumentSnapshot['rating'],
                style: TextStyle(fontSize: 2.59067357 * SizeConfig.textMultiplier, color: Colors.grey.shade500),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 83.333333333 * SizeConfig.widthMultiplier),
              child: Text(widget.queryDocumentSnapshot['name'],
                  style: TextStyle(
                      fontSize: 3.6269430 * SizeConfig.textMultiplier,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400)),
            ),
            Row(
              children: [
                Text(
                  "Rs. ",
                  style: TextStyle(
                      fontSize: 2.59067357 * SizeConfig.textMultiplier,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.queryDocumentSnapshot['price'].toString(),
                  style: TextStyle(
                      fontSize: 2.59067357 * SizeConfig.textMultiplier,
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget footerDetails() {
    return SizedBox(
      height: 38.8601036 * SizeConfig.heightMultiplier,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 83.33333333 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 5,
                        spreadRadius: 3)
                  ]),
              width: 111.111111 * SizeConfig.widthMultiplier,
              child: Padding(
                padding:
<<<<<<< HEAD
                EdgeInsets.only(top: 5.1813471 * SizeConfig.heightMultiplier, right: 5.555555 * SizeConfig.widthMultiplier, left: 5.555555 * SizeConfig.widthMultiplier),
=======
                     EdgeInsets.only(top: 5.1813471 * SizeConfig.heightMultiplier, right: 5.555555 * SizeConfig.widthMultiplier, left: 5.555555 * SizeConfig.widthMultiplier),
>>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
<<<<<<< HEAD
                    // Text(
                    //   '',
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 3.1088082 * SizeConfig.textMultiplier,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text(
                    //       "Cheese",
                    //       style: TextStyle(
                    //           color: Colors.grey.shade500, fontSize: 2.84974093 * SizeConfig.textMultiplier),
                    //     ),
                    //     Row(
                    //       children: [
                    //         IconButton(
                    //             icon: Icon(EvaIcons.minus), onPressed: () {
                    //           Provider.of<Calculations>(context, listen: false).minusCheese();
                    //         }),
                    //         Text(
                    //           Provider.of<Calculations>(context, listen: true).getCheeseValue.toString(),
                    //           style: TextStyle(
                    //               fontSize: 2.590673575 * SizeConfig.textMultiplier, color: Colors.grey.shade500),
                    //         ),
                    //         IconButton(
                    //             icon: Icon(EvaIcons.plus), onPressed: () {
                    //           Provider.of<Calculations>(context, listen: false).addCheese();
                    //         }),
                    //       ],
                    //     )
                    //   ],
                    // ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text(
                    //       "Beacon",
                    //       style: TextStyle(
                    //           color: Colors.grey.shade500, fontSize: 2.84974093 * SizeConfig.textMultiplier),
                    //     ),
                    //     Row(
                    //       children: [
                    //         IconButton(
                    //             icon: Icon(EvaIcons.minus), onPressed: () {
                    //           Provider.of<Calculations>(context, listen: false).minusBeacon();
                    //         }),
                    //         Text(
                    //           Provider.of<Calculations>(context, listen: true).getBeaconValue.toString(),
                    //           style: TextStyle(
                    //               fontSize: 2.59067357512 * SizeConfig.textMultiplier, color: Colors.grey.shade500),
                    //         ),
                    //         IconButton(
                    //             icon: Icon(EvaIcons.plus), onPressed: () {
                    //           Provider.of<Calculations>(context, listen: false).addBeacon();
                    //         }),
                    //       ],
                    //     )
                    //   ],
                    // ),
                    Flexible(child: Text(widget.queryDocumentSnapshot['description'])),
=======
                    Text(
                      'Add more stuff',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 3.1088082 * SizeConfig.textMultiplier,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Cheese",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 2.84974093 * SizeConfig.textMultiplier),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {
                                  Provider.of<Calculations>(context, listen: false).minusCheese();
                            }),
                            Text(
                              Provider.of<Calculations>(context, listen: true).getCheeseValue.toString(),
                              style: TextStyle(
                                  fontSize: 2.590673575 * SizeConfig.textMultiplier, color: Colors.grey.shade500),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus), onPressed: () {
                              Provider.of<Calculations>(context, listen: false).addCheese();
                            }),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Beacon",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 2.84974093 * SizeConfig.textMultiplier),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {
                              Provider.of<Calculations>(context, listen: false).minusBeacon();
                            }),
                            Text(
                              Provider.of<Calculations>(context, listen: true).getBeaconValue.toString(),
                              style: TextStyle(
                                  fontSize: 2.59067357512 * SizeConfig.textMultiplier, color: Colors.grey.shade500),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus), onPressed: () {
                              Provider.of<Calculations>(context, listen: false).addBeacon();
                            }),
                          ],
                        )
                      ],
                    ),
>>>>>>> 4d8b76ed2594317a0bc20d12fb7589048c931ee0
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 2.84974093 * SizeConfig.textMultiplier),
                        ),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(EvaIcons.minus), onPressed: () {
                              Provider.of<Calculations>(context, listen: false).minusQuantity();
                            }),
                            Text(
                              Provider.of<Calculations>(context, listen: true).getQuantity.toString(),
                              style: TextStyle(
                                  fontSize: 2.590673575 * SizeConfig.textMultiplier, color: Colors.grey.shade500),
                            ),
                            IconButton(
                                icon: Icon(EvaIcons.plus), onPressed: () {
                              Provider.of<Calculations>(context, listen: false).addQuantity();
                            }),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  Provider.of<Calculations>(context, listen: false).selectSmallSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color:Provider.of<Calculations>(context, listen: true)
                          .smallTapped ? Colors.red
                          : Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'S',
                      style: TextStyle(fontSize: 2.590673575 * SizeConfig.textMultiplier),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Provider.of<Calculations>(context, listen: false).selectMediumSize();
                },
                child: Container(

                  decoration: BoxDecoration(
                      color:Provider.of<Calculations>(context, listen: true)
                          .mediumTapped
                          ? Colors.red
                          :Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 2.590673575 * SizeConfig.textMultiplier),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Provider.of<Calculations>(context, listen: false).selectLargeSize();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color:Provider.of<Calculations>(context, listen: true).largeTapped ? Colors.red:Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 2.590673575 * SizeConfig.textMultiplier),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Calculations>(context, listen: false)
                .addToCart(context, {
              'image':widget.queryDocumentSnapshot['image'],
              'name':widget.queryDocumentSnapshot['name'],
              'price':widget.queryDocumentSnapshot['price'],
              // 'onion':Provider.of<Calculations>(context, listen: false).getOnionValue,
              // 'beacon':Provider.of<Calculations>(context, listen: false).getBeaconValue,
              // 'cheese':Provider.of<Calculations>(context, listen: false).getCheeseValue,
              'quantity':Provider.of<Calculations>(context, listen: false).getQuantity,
              'size':Provider.of<Calculations>(context, listen: false).getSize
            });

          },
          child: Container(
            width: 69.4444444 * SizeConfig.widthMultiplier,
            height: 6.4766839 * SizeConfig.heightMultiplier,
            decoration: BoxDecoration(
                color: Colors.red.shade500,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Add To Cart',
                style: TextStyle(
                  fontSize: 2.590673575 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: CartScreen(),
                        type: PageTransitionType.rightToLeftWithFade));
              },
              child: Icon(
                Icons.shopping_basket,
                color: Colors.black,
              ),
            ),
            Positioned(
                left: 9.72222222 * SizeConfig.widthMultiplier,
                child: CircleAvatar(
                  radius: 10,
                  child: Text(Provider.of<Calculations>(context, listen: true).getCartData.toString()),
                ))
          ],
        )
      ],
    );
  }
}
