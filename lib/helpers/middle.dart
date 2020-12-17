import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/screens/detail_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:provider/provider.dart';

class MiddleHelpers extends ChangeNotifier {
  //TODO: FAVOURITE HEADING TEXT
  Widget textFav() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RichText(
        text: TextSpan(
            text: 'Favourite ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 36,
                color: Colors.black,
                shadows: [BoxShadow(color: Colors.black, blurRadius: 1)]),
            children: <TextSpan>[
              TextSpan(
                text: ' dishes??',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22.0,
                    color: Colors.grey,
                    shadows: [BoxShadow(color: Colors.grey, blurRadius: 0)]),
              )
            ]),
      ),
    );
  }

  //TODO:GETTING DATA FROM PRODUCTS COLLECTTION FORESTORE
  Widget dataFromFav(BuildContext context, String collection) {
    return Container(
      height: 300.0,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset("animations/delivery.json"),
            );
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, PageTransition(
                        child: DetailScreen(
                          queryDocumentSnapshot: snapshot.data[index],
                        ),
                        type: PageTransitionType.topToBottom));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                blurRadius: 5,
                                spreadRadius: 3)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 180,
                                child: Image.network(
                                  snapshot.data[index].data()['image'],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Positioned(
                                  left: 140.0,
                                  child: IconButton(
                                    icon: Icon(EvaIcons.heart),
                                    onPressed: () {},
                                  ))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              snapshot.data[index].data()['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              snapshot.data[index].data()['category'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.cyan,
                                  fontSize: 16.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                    ),
                                    Text(
                                      snapshot.data[index].data()['rating'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 16.0),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Row(
                                    children: [
                                      Text("Rs. ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 16.0)),
                                      Text(
                                        snapshot.data[index]
                                            .data()['price']
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }



  //TODO: Business HEADING TEXT
  Widget textBusiness() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RichText(
        text: TextSpan(
            text: 'Business ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 36,
                color: Colors.black,
                shadows: [BoxShadow(color: Colors.black, blurRadius: 1)]),
            children: <TextSpan>[
              TextSpan(
                text: ' lunch',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22.0,
                    color: Colors.grey,
                    shadows: [BoxShadow(color: Colors.grey, blurRadius: 0)]),
              )
            ]),
      ),
    );
  }

  //TODO:GETTING DATA FROM PRODUCTS COLLECTTION FORESTORE
  Widget dataBusiness(BuildContext context, String collection) {
    return Container(
      height: 400.0,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData(collection),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset("animations/delivery.json"),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 5,
                                  spreadRadius: 3)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].data()['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 26.0),
                                  ),
                                  Text(
                                    snapshot.data[index].data()['category'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.cyan,
                                        fontSize: 22.0),
                                  ),
                                  Text(
                                    snapshot.data[index].data()['notPrice'].toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.cyan,
                                        fontSize: 18.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(" Rs. ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 18.0)),
                                      Text(
                                        snapshot.data[index].data()['price'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 25.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 300,
                              width: 150,
                              child: Image.network(
                                  snapshot.data[index].data()['image'], fit: BoxFit.fitWidth,),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
