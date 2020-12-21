import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/providers/calculations.dart';
import 'package:pizzato/screens/detail_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class ShoesProducts extends StatefulWidget {
  @override
  _ShoesProductsState createState() => _ShoesProductsState();
}

class _ShoesProductsState extends State<ShoesProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shoes"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            dataFromFav(context, 'shoes'),

          ],
        ),
      ),
    );
  }




  //TODO:GETTING DATA FROM PRODUCTS COLLECTION FIRESTORE
  Widget dataFromFav(BuildContext context, String collection) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
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
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
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
                      height: 40.860103 * SizeConfig.heightMultiplier,
                      width: 53.555555 * SizeConfig.widthMultiplier,
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
                          Center(
                            child: SizedBox(
                              height: 200,
                              child: Image.network(
                                snapshot.data[index].data()['image'],
                                //fit: BoxFit.cover,
                                width: 300,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              snapshot.data[index].data()['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 4.33160621 * SizeConfig.textMultiplier),
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
                                          fontSize: 3.0725388 * SizeConfig.textMultiplier),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 13.8888888 * SizeConfig.widthMultiplier),
                                  child: Row(
                                    children: [
                                      Text("Rs. ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 2.0725388 * SizeConfig.textMultiplier)),
                                      Text(
                                        snapshot.data[index]
                                            .data()['price']
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 3.0725388 * SizeConfig.textMultiplier),
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





}
