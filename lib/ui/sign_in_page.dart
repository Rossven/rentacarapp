import 'package:car_rent/components/back_button.dart';
import 'package:car_rent/components/text_fields.dart';
import 'package:car_rent/ui/rented_page.dart';
import 'package:car_rent/ui/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_rent/ui/forgot_password_page.dart';
import 'package:car_rent/components/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'forgot_password_page.dart';

dynamic userEmail = "asd";
dynamic errorcode = "";

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                    "Welcome",
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
                    "Back!",
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
            Text(errorcode),
            Container(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(primary: orangeColor),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 16),
                  ),
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
                    "Sign In",
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
                      signIn(context);
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
            signUpOption(context),
            backButton(context),
          ],
        ),
      ),
    );
  }
}

Future signIn(context) async {
  //iki şifreyi karşılaştırma if'i eklenecek, aynı e mail olamaz,

  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => RentedPage(email: emailController.text)),
        (Route<dynamic> route) => false,
      );
    });
    userEmail = emailController.text;
    Fluttertoast.showToast(
        msg: "Login Successful.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Fluttertoast.showToast(
          msg: "No user found for that email.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      errorcode = "No user found for that email.";
    } else if (e.code == 'wrong-password') {
      errorcode = "Wrong password provided for that user.";
      Fluttertoast.showToast(
          msg: "Wrong password provided for that user.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (e.code == 'invalid-email') {
      Fluttertoast.showToast(
          msg: "Email address is invalid.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

Row signUpOption(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(padding: EdgeInsets.only(left: 40, top: 40)),
      const Text("Don't have account?",
          style: TextStyle(color: Colors.white70)),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: orangeColor, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

String getMessageFromErrorCode(errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already used. Go to login page.";
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong email/password combination.";
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "No user found with this email.";
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled.";
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests to log into this account.";
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return "Server error, please try again later.";
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Email address is invalid.";
      break;
    default:
      return "Login failed. Please try again.";
      break;
  }
}
