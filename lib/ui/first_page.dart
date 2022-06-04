import 'package:car_rent/components/colors.dart';
import 'package:car_rent/ui/sign_in_page.dart';
import 'package:car_rent/ui/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//RaisedButton yerine Elevated kullan bi ara

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blackColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 194),
                  child: Column(
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "RentaCar",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: ButtonTheme(
                          minWidth: 275.0,
                          height: 50.0,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignInPage(),
                                ),
                              );
                            },
                            elevation: 5.0,
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            color: orangeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: ButtonTheme(
                          minWidth: 275.0,
                          height: 50.0,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            elevation: 5.0,
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            color: orangeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
