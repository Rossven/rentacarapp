import 'package:car_rent/components/back_button.dart';
import 'package:car_rent/ui/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/text_fields.dart';
import 'package:car_rent/ui/pick_up_page.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    "Create an",
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
                    "Account",
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
            buildPasswordTF(),
            const SizedBox(
              height: 35.0,
            ),
            confirmPasswordTF(),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(
                  right: 25.0,
                  left: 25.0,
                ),
                child: Text(
                  "By clicking the Sign Up button, you agree to the public offer",
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
                    "Sign Up",
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
                      signUp(context);
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

Future signUp(context) async {
  //iki şifreyi karşılaştırma if'i eklenecek, aynı e mail olamaz,
  if (cPasswordController.text == passwordController.text) {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        print("Created New Account");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  } else {
    print("unmatch passwords");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}
