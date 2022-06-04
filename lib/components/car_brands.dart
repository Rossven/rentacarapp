import 'package:car_rent/car.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/ui/cars_page.dart';
import 'package:flutter/material.dart';

Widget carBrands(String str, String carCity, String carDate, context) {
  dynamic path;
  path = str;
  return Container(
      width: 150,
      height: 150,
      margin: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: IconButton(
        icon: Image.asset(str),
        iconSize: 50,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CarsPage(brandPath: path, carCity: carCity, carDate: carDate),
            ),
          );
        },
      ));
}
