import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/screens/detail_screen.dart';
import 'package:pizzato/services/manageData.dart';
import 'package:provider/provider.dart';

class MiddleHelpers extends ChangeNotifier {
  //TODO: FAVOURITE HEADING TEXT
  Widget textFav() {
    return Padding(
      padding: EdgeInsets.only(top: 2.5906735 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: 'Favourite ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 4.6632124 * SizeConfig.textMultiplier,
                color: Colors.black,
                shadows: [BoxShadow(color: Colors.black, blurRadius: 1)]),
            children: <TextSpan>[
              TextSpan(
                text: ' top sellers',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 2.8497409 * SizeConfig.textMultiplier,
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
      height: 40.860103 * SizeConfig.heightMultiplier,
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
                      height: 39.860103 * SizeConfig.heightMultiplier,
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
                          Stack(
                            children: [

                              Center(
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(
                                    snapshot.data[index].data()['image'],
                                  )),),


                              Positioned(
                                  left: 38.88888 * SizeConfig.widthMultiplier,
                                  child: IconButton(
                                    icon: Icon(EvaIcons.heart, color: Colors.red,),
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
                                  fontSize: 2.33160621 * SizeConfig.textMultiplier),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              snapshot.data[index].data()['category'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.cyan,
                                  fontSize: 2.0725388 * SizeConfig.textMultiplier),
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
                                          fontSize: 2.0725388 * SizeConfig.textMultiplier),
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
                                            fontSize: 2.0725388 * SizeConfig.textMultiplier),
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
      padding: EdgeInsets.only(top: 2.590673575 * SizeConfig.heightMultiplier),
      child: RichText(
        text: TextSpan(
            text: 'Discount ',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 4.66321243 * SizeConfig.textMultiplier,
                color: Colors.black,
                shadows: [BoxShadow(color: Colors.black, blurRadius: 1)]),
            children: <TextSpan>[
              TextSpan(
                text: ' upto 50%',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 2.8497409 * SizeConfig.textMultiplier,
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
      height:45.8134715 * SizeConfig.heightMultiplier,
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
                              padding: EdgeInsets.only(left: 2.2222222 * SizeConfig.widthMultiplier),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index].data()['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 2.84974093 * SizeConfig.textMultiplier),
                                  ),
                                  Text(
                                    snapshot.data[index].data()['category'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.cyan,
                                        fontSize: 2.84974093 * SizeConfig.textMultiplier),
                                  ),
                                  Text(
                                    snapshot.data[index].data()['notPrice'].toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.cyan,
                                        fontSize: 2.3316062 * SizeConfig.textMultiplier),
                                  ),
                                  Row(
                                    children: [
                                      Text(" Rs. ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 2.3316062 * SizeConfig.textMultiplier)),
                                      Text(
                                        snapshot.data[index].data()['price'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 3.23834196 * SizeConfig.textMultiplier),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 51.81347150 * SizeConfig.heightMultiplier,
                              width: 35.6666666 * SizeConfig.widthMultiplier,
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