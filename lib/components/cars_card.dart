import 'package:car_rent/car.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/ui/car_detail.dart';

import 'package:flutter/material.dart';

Widget carCards(Car car, String carCity, String carDate, context) {
  return Stack(
    children: [
      Positioned(
        child: Container(
          height: 120,
          width: 350,
          margin: new EdgeInsets.only(top: 40),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      Positioned(
        width: 175,
        left: 20,
        child: Image.asset(car.carImage),
      ),
      Positioned(
        left: 25,
        top: 125,
        child: Text(
          car.carBrand + " " + car.carModel,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: blackColor,
            fontSize: 19,
          ),
        ),
      ),
      Positioned(
        top: 105,
        left: 205,
        child: ButtonTheme(
          minWidth: 130,
          height: 40,

          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => carDetail(
                    car: car,
                  ),
                ),
              );
            },
            //elevation: 5.0,
            child: const Text(
              "Details",
              style: TextStyle(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            color: orangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      Positioned(
        top: 50,
        left: 250,
        child: Text(
          "\$" + car.price,
          style: const TextStyle(
            color: blackColor,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      const Positioned(
        top: 85,
        left: 270,
        child: Text(
          "/per day",
          style: TextStyle(
            color: blackColor,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
        ),
      )
    ],
    //margin: new EdgeInsets.only(top: 20),
  );
}
