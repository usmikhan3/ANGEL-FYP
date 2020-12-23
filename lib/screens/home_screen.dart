import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/footer.dart';
import 'package:pizzato/helpers/headers.dart';
import 'package:pizzato/helpers/middle.dart';
import 'package:pizzato/screens/about_screen.dart';
import 'package:pizzato/services/manageMaps.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_screen.dart';
import 'login_screen.dart';

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
        child: Container(
          color: Color(0xFF0ffcdd2),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  label: "This is User Account information",
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.redAccent
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("assets/man.png"),
                      ),
                      accountName: Semantics(
                        label: "Name of the User",
                          child: Text("Muhammad Usman Khan")),
                      accountEmail: Semantics(
                          label: "Email of the user usmi.khan3@gmail.com",
                          child: Text("usmi.khan3@gmail.com"))),
                ),

                Semantics(
                  label: "Profile Tab",
                  button: true,
                  child: ListTile(
                    leading: ExcludeSemantics(
                        excluding: true,
                        child: Icon(Icons.person)),
                    title: Text("Profile"),
                    onTap: (){},
                  ),
                ),

                Semantics(
                  label: "cart Tab",
                  button: true,
                  child: ListTile(
                    leading: ExcludeSemantics(
                        excluding: true,
                        child: Icon(Icons.add_shopping_cart)),
                    title: Text("Cart"),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                    },
                  ),
                ),

                Semantics(
                  label: "Order Tab",
                  button: true,
                  child: ListTile(
                    leading: ExcludeSemantics(
                        excluding: true,
                        child: Icon(Icons.shopping_bag_rounded)),
                    title: Text("Order"),
                    onTap: (){
                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                    },
                  ),
                ),

                Semantics(
                  label: "About Tab, to see Developers information",
                  button: true,
                  child: ListTile(
                    leading: ExcludeSemantics(
                        excluding: true,
                        child: Icon(Icons.info)),
                    title: Text("About"),
                    onTap: (){
                      Navigator.push(context, PageTransition(child: AboutPage(), type: PageTransitionType.bottomToTop));
                    },
                  ),
                ),
                Semantics(
                  label: "Log out Tab",
                  button: true,
                  child: ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Log out"),
                    onTap: () async{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.remove('uid');
                      Navigator.pushReplacement(context, PageTransition
                        (child: LoginScreen(),
                          type: PageTransitionType.leftToRightWithFade));
                    },
                  ),
                ),






              ],
            ),
          ),
        ),
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
