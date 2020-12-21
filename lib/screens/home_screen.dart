import 'package:flutter/material.dart';
import 'package:pizzato/helpers/footer.dart';
import 'package:pizzato/helpers/headers.dart';
import 'package:pizzato/helpers/middle.dart';
import 'package:pizzato/services/manageMaps.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<GenerateMaps>(context, listen: false).getCurrentLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

      ),
        floatingActionButton: Footers().floatingActionButton(context),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headers().appBar(context),
                Headers().headerText(),
                Headers().headerMenu(context),
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
