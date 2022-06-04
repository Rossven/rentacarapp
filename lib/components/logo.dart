import 'package:car_rent/components/colors.dart';
import 'package:flutter/material.dart';

Widget rentaCarLogo() {
  return Container(
    margin: const EdgeInsets.only(top: 56),
    child: const Text(
      "RentaCar",
      style:
          TextStyle(fontFamily: 'BrunoAce', color: orangeColor, fontSize: 32),
    ),
  );
}
