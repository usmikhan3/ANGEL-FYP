import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Headers extends ChangeNotifier{

  Widget appBar(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top:50) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(FontAwesomeIcons.userAlt), onPressed: (){}),
          Row(
            children: [
              Icon(FontAwesomeIcons.locationArrow),
              Text("Saadi Town", style: TextStyle(
                color: Colors.grey.shade600, fontSize: 12.0,fontWeight: FontWeight.w600
              ),
              ),
              IconButton(icon: Icon(FontAwesomeIcons.search, color: Colors.black,), onPressed: (){}),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerText(){
    return Container(
      constraints: BoxConstraints(
        maxWidth: 293
      ),
      child: RichText(
        text: TextSpan(
          text: 'What would you like ',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 29, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: 'to eat?',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 46.0, color: Colors.black),
            )
          ]
        ),
      ),
    );
  }


  Widget headerMenu(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                   color: Colors.redAccent,
                      blurRadius: 15
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                color: Colors.grey.shade100
              ),
              height: 40,
              width: 100,
              child:Center(
                child: Text(
                  'All Food',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )  ,
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.lightBlueAccent,
                        blurRadius: 15
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.grey.shade100
              ),
              height: 40,
              width: 100,
              child:Center(
                child: Text(
                  'Pizza',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )  ,
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green,
                        blurRadius: 15
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.grey.shade100
              ),
              height: 40,
              width: 100,
              child:Center(
                child: Text(
                  'Pasta',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )  ,
            ),
          ),

        ],
      ),
    );
  }


  



}