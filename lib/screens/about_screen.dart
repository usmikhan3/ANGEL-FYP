import 'package:flutter/material.dart';
import 'package:pizzato/helpers/size_config.dart';

class AboutPage extends StatelessWidget {
  final List<String> _list = [
    'assets/man.png',
    'assets/man.png',
    'assets/man.png',
    'assets/man.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              "About",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )),
        body: Column(
          children: [
            Center(
              child: Semantics(
                label: "Developers name of this mobile Application",
                child: Text(
                  "Developers",
                  style: TextStyle(
                      fontSize: 2.59067357 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ExcludeSemantics(
                        excluding: true,
                        child: Container(
                          height: 19.430051 * SizeConfig.heightMultiplier,
                          width: 41.666666 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/uk.png"),
                                  fit: BoxFit.fill),
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                      Semantics(
                        label: "Muhammad Usman Khan",
                          child: Text(
                        "Muhammad Usman Khan",
                        style: TextStyle(
                            fontSize: 1.81347150 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                  Column(
                    children: [
                      ExcludeSemantics(
                        excluding: true,
                        child: Container(
                          height: 19.430051 * SizeConfig.heightMultiplier,
                          width: 41.666666 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/mo.jpeg"),
                                fit: BoxFit.fill
                              ),
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                      Semantics(
                        label: "Moeid Iqbal Khan",
                        child: Text(
                          "Moeid Iqbal Khan",
                          style: TextStyle(
                              fontSize: 1.81347150 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ExcludeSemantics(
                        excluding: true,
                        child: Container(
                          height: 19.430051 * SizeConfig.heightMultiplier,
                          width: 41.666666 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/jk.jpeg"),
                                  fit: BoxFit.fill),
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                      Semantics(
                        label: "Jibran Khalid",
                        child: Text(
                          "Jibran Khalid",
                          style: TextStyle(
                              fontSize: 1.81347150 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      ExcludeSemantics(
                        excluding: true,
                        child: Container(
                          height: 19.430051 * SizeConfig.heightMultiplier,
                          width: 41.666666 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/sa.jpg"),
                                  fit: BoxFit.fill),
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                      Semantics(
                        label: "Salman Ahmed",
                        child: Text(
                          "Salman Ahmed",
                          style: TextStyle(
                              fontSize: 1.81347150 * SizeConfig.textMultiplier, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
