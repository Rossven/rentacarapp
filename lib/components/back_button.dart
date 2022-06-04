import 'package:flutter/material.dart';
import 'package:car_rent/components/colors.dart';

Widget backButton(ctx) {
  return Expanded(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: TextButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          child: const Text(
            "Back",
            style: TextStyle(
              color: lightgreyColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    ),
  );
}
