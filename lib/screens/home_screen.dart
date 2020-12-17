import 'package:flutter/material.dart';
import 'package:pizzato/helpers/footer.dart';
import 'package:pizzato/helpers/headers.dart';
import 'package:pizzato/helpers/middle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Footers().floatingActionButton(context),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headers().appBar(context),
                Headers().headerText(),
                Headers().headerMenu(context),
                Divider(),
                MiddleHelpers().textFav(),
                MiddleHelpers().dataFromFav(context, 'favourite'),
                MiddleHelpers().textBusiness(),
                MiddleHelpers().dataBusiness(context, 'business')
              ],
            ),
          ),
        ));
  }
}
