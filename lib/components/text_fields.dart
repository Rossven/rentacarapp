import 'package:car_rent/components/box_decoration.dart';
import 'package:car_rent/components/colors.dart';
import 'package:flutter/material.dart';

TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController cPasswordController = TextEditingController();

Widget buildEmailTF() {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kBoxDecoration,
    height: 60.0,
    width: 350.0,
    child: TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: whiteColor),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          Icons.email,
          color: lightgreyColor,
        ),
        hintText: "Email",
        hintStyle: TextStyle(
          color: lightgreyColor,
        ),
      ),
    ),
  );
}

Widget buildPasswordTF() {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kBoxDecoration,
    height: 60.0,
    width: 350.0,
    child: TextField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: whiteColor),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          Icons.lock,
          color: lightgreyColor,
        ),
        hintText: "Password",
        hintStyle: TextStyle(
          color: lightgreyColor,
        ),
      ),
    ),
  );
}

Widget confirmPasswordTF() {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kBoxDecoration,
    height: 60.0,
    width: 350.0,
    child: TextField(
      controller: cPasswordController,
      obscureText: true,
      style: TextStyle(color: whiteColor),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 14.0),
        prefixIcon: Icon(
          Icons.lock,
          color: lightgreyColor,
        ),
        hintText: "Confirm Password",
        hintStyle: TextStyle(
          color: lightgreyColor,
        ),
      ),
    ),
  );
}

Widget buildLocationTF() {
  return Container(
    alignment: Alignment.centerLeft,
    decoration: kLocBoxDecoration,
    height: 33.0,
    width: 350.0,
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: whiteColor),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(bottom: 9),
        prefixIcon: Icon(
          Icons.search,
          color: orangeColor,
        ),
        hintText: "Search for a city or a place",
        hintStyle: TextStyle(
          color: lightgreyColor,
        ),
      ),
    ),
  );
}
