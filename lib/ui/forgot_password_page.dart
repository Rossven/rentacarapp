import 'package:car_rent/components/back_button.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/text_fields.dart';
import 'package:car_rent/ui/first_page.dart';
import 'package:car_rent/ui/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: blackColor,
        margin: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Forgot",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Password?",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 32,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            buildEmailTF(),
            const SizedBox(
              height: 35.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(
                  right: 25.0,
                  left: 25.0,
                ),
                child: Text(
                  "* We will send you a mail to reset your password",
                  style: TextStyle(fontSize: 16, color: lightgreyColor),
                ),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Send Mail",
                    style: TextStyle(
                      fontSize: 30,
                      color: whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 80.0,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      forgot(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(
                      child: const Icon(Icons.arrow_forward),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: orangeColor,
                            spreadRadius: 15,
                            blurRadius: 30,
                          )
                        ],
                      ),
                    ),
                    backgroundColor: orangeColor,
                    foregroundColor: whiteColor,
                  ),
                ],
              ),
            ),
            backButton(context),
          ],
        ),
      ),
    );
  }
}

Future forgot(context) async {
  FirebaseAuth.instance
      .sendPasswordResetEmail(email: emailController.text)
      .then((value) => {
            // Password reset email sent!
            // ..
          })
      .catchError((error) => {print(error)});
}
