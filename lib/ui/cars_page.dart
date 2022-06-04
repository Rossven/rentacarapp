import 'package:car_rent/components/car_brands.dart';
import 'package:car_rent/components/cars_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/logo.dart';
import 'package:car_rent/car.dart';

dynamic gearboxopt = true;
dynamic basilmismigearbox = true;
dynamic basilmismifuel = true;
dynamic fuelopt = true;

class CarsPage extends StatelessWidget {
  final String brandPath;
  final String carCity;
  final String carDate;
  const CarsPage(
      {Key? key,
      required this.brandPath,
      required this.carCity,
      required this.carDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rentaCarLogo(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Cars",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      basilmismigearbox
                          ? Text(
                              "All",
                              style: TextStyle(
                                fontSize: 15,
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Text(
                              gearBoxType(),
                              style: TextStyle(
                                fontSize: 15,
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      IconButton(
                          icon: Image.asset("assets/icons/gearbox.png"),
                          iconSize: 40,
                          onPressed: () {
                            gearboxButton(context, brandPath, carCity, carDate);
                          }),
                      basilmismifuel
                          ? Text(
                              "All",
                              style: TextStyle(
                                fontSize: 15,
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Text(
                              fuelType(),
                              style: TextStyle(
                                fontSize: 15,
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      IconButton(
                          icon: Image.asset("assets/icons/fuel.png"),
                          onPressed: () {
                            fuelButton(context, brandPath, carCity, carDate);
                          }),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Car>>(
              future: readCars().first,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("asd");
                } else {
                  final cars = snapshot.data!;
                  print(cars.elementAt(0).carGearbox);
                  return GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: (2),
                    shrinkWrap: true,
                    //crossAxisSpacing: 5,
                    // mainAxisSpacing: 5,
                    physics: ScrollPhysics(),
                    //padding: EdgeInsets.all(10.0),
                    children: cars
                        .where((element) =>
                            element.isRented == "false" &&
                            element.carBrandImage == brandPath &&
                            isDateOk(element, carDate) &&
                            element.location == carCity &&
                            (basilmismigearbox ||
                                element.carGearbox == gearBoxType()) &&
                            (basilmismifuel || element.carFuel == fuelType()))
                        .map((data) => Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  carCards(data, carCity, carDate, context),
                                ],
                              ),
                            ))
                        .toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

bool isDateOk(Car car, String date) {
  DateTime dt = DateTime.parse(date);
  DateTime dtst = DateTime.parse(car.availableStart);
  DateTime dtend = DateTime.parse(car.availableEnd);

  if ((dt.isBefore(dtend) || dt.isAtSameMomentAs(dtend)) &&
      (dt.isAfter(dtst) || dt.isAtSameMomentAs(dtst))) {
    print("true");
    return true;
  } else {
    print("false");
    return false;
  }
}

void gearboxButton(context, brandPath, carCity, carDate) {
  if (gearboxopt == true && basilmismigearbox == true) {
    gearboxopt = true;
    basilmismigearbox = false;
  } else if (gearboxopt == true && basilmismigearbox == false) {
    gearboxopt = false;
  } else if (gearboxopt == false && basilmismigearbox == false) {
    gearboxopt = true;
    basilmismigearbox = true;
  }

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => CarsPage(
              brandPath: brandPath, carCity: carCity, carDate: carDate)));
}

void fuelButton(context, brandPath, carCity, carDate) {
  if (fuelopt == true && basilmismifuel == true) {
    fuelopt = true;
    basilmismifuel = false;
  } else if (fuelopt == true && basilmismifuel == false) {
    fuelopt = false;
  } else if (fuelopt == false && basilmismifuel == false) {
    fuelopt = true;
    basilmismifuel = true;
  }

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => CarsPage(
              brandPath: brandPath, carCity: carCity, carDate: carDate)));
}

String gearBoxType() {
  if (gearboxopt == true) {
    return "Auto";
  } else {
    return "Manuel";
  }
}

String fuelType() {
  if (fuelopt == true) {
    return "Diesel";
  } else {
    return "Oil";
  }
}
