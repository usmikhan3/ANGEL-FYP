import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pizzato/helpers/size_config.dart';
import 'package:pizzato/providers/authentication.dart';
import 'package:pizzato/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Semantics(
        label: "CHoose Whether to login or Sign Up",
        container: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ExcludeSemantics(
                  excluding: true,
                  child: Container(
                    height: 38.86010 * SizeConfig.heightMultiplier,
                    width: 83.3333333 * SizeConfig.widthMultiplier,
                    child: Lottie.asset("animations/shoppingbag.json"),
                  ),
                ),
                Semantics(
                  label: "Angel- Name of the application",
                  child: RichText(
                      text: TextSpan(
                          text: 'An',
                          style: TextStyle(
                              fontSize: 7.2538860 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: <TextSpan>[
                        TextSpan(
                          text: 'g',
                          style: TextStyle(
                              fontSize: 7.2538860 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        TextSpan(
                          text: 'el',
                          style: TextStyle(
                              fontSize: 7.2538860 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Semantics(
                      label: "Login Button to open login form",
                      button: true,
                      child: MaterialButton(
                        color: Colors.black54,
                        onPressed: () {
                          loginSheet(context);
                        },
                        child: Semantics(
                          label: "Login",
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Semantics(
                      label: "Sign Up Button to open Sign Up form",
                      child: MaterialButton(
                        color: Colors.black54,
                        onPressed: () {
                          signUpSheet(context);
                        },
                        child: Semantics(
                          label: "Sign Up",
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Semantics(
            label: "Login Form Sheet",
            container: true,
            child: new Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(color: Colors.blueGrey.shade700),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Semantics(
                        label: "Texfield for Email",
                        hint: "Enter Email",
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'RaleWay')),
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Semantics(
                        label: "Text field for Password",
                        hint: "Enter password",
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'RaleWay')),
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Semantics(
                        label: "Login button ",
                        button: true,
                        child: MaterialButton(
                          color: Colors.lightGreenAccent,
                          onPressed: () =>
                              Provider.of<Authentication>(context, listen: false)
                                  .loginIntoAccount(
                                      emailController.text, passwordController.text)
                                  .whenComplete(() {
                            if (Provider.of<Authentication>(context, listen: false)
                                    .getErrorMessage ==
                                '') {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: HomeScreen(),
                                      type:
                                          PageTransitionType.leftToRightWithFade));
                            }
                            if (Provider.of<Authentication>(context, listen: false)
                                    .getErrorMessage !=
                                '') {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: LoginScreen(),
                                      type:
                                          PageTransitionType.leftToRightWithFade));
                            }
                          }),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      Provider.of<Authentication>(context, listen: true)
                          .getErrorMessage,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  signUpSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Semantics(
            label: "Sign Up sheet",
            container: true,
            child: new Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(color: Colors.blueGrey.shade700),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Semantics(
                        label: "Text Field for Email",
                        hint: "Enter Email",
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'RaleWay')),
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Semantics(
                        label: "Text Field for password",
                        hint: "Enter Password",
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'RaleWay')),
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.lightGreenAccent,
                        onPressed: () =>
                            Provider.of<Authentication>(context, listen: false)
                                .createNewAccount(
                                    emailController.text, passwordController.text)
                                .whenComplete(() {
                          if (Provider.of<Authentication>(context, listen: false)
                                  .getErrorMessage !=
                              null) {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomeScreen(),
                                    type:
                                        PageTransitionType.leftToRightWithFade));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: LoginScreen(),
                                    type:
                                        PageTransitionType.leftToRightWithFade));
                          }
                        }),
                        child: Semantics(
                          label: "Sign Up Button",
                          button: true,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      Provider.of<Authentication>(context, listen: true)
                          .getErrorMessage,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
