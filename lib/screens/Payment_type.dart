import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/screens/credit_payment.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment Methods"),
        elevation: 0.0,
      ),

      body: Column(


        children: [
          GestureDetector(
            onTap: (){
                Navigator.push(context, PageTransition(child: CreditCard(), type: PageTransitionType.rightToLeft));
            },
            child: ListTile(
              title: Text("Credit/Debit Card"),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/visa2.gif",),
              ),
              trailing: Icon(EvaIcons.arrowForward),

            ),
          ),
          Divider(),
          GestureDetector(
            onTap: (){},
            child: ListTile(
              title: Text("Cash On delivery"),
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/cod.webp",),
              ),
              trailing: Icon(EvaIcons.arrowForward),

            ),
          ),

        ],
      ),



    );
  }
}
