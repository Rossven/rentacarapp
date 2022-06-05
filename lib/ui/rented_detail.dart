import 'package:car_rent/car.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/logo.dart';
import 'package:car_rent/components/rented_card.dart';
import 'package:car_rent/components/white_logo.dart';
import 'package:car_rent/ui/rented_page.dart';
import 'package:car_rent/ui/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class rentedDetail extends StatelessWidget {
  final Car car;

  const rentedDetail({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              color: whiteColor,
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                        flex: 10,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              rentaCarLogoWhite(),
                            ],
                          ),
                        ))
                  ],
                ),
                Row(children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Container(
                            //margin: EdgeInsets.only(top: 20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    car.carImage,
                                    scale: 0.6,
                                  )
                                ]),
                          ))),
                ]),
              ])),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Text(
                    car.carBrand + " " + car.carModel,
                    style: TextStyle(
                      fontSize: 30,
                      color: whiteColor,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Pick-up info:" +
                        "  " +
                        car.location +
                        " / " +
                        DateFormat("dd.MM")
                            .format(DateTime.parse(car.availableStart)) +
                        "-" +
                        DateFormat("dd.MM.yyyy")
                            .format(DateTime.parse(car.availableEnd)),
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Brand:" + "  " + car.carBrand,
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Model:" + "  " + car.carModel,
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Gearbox:" + "  " + car.carGearbox,
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Fuel:" + "  " + car.carFuel,
                    style: TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 90, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$" + car.price,
                      style: TextStyle(
                        fontSize: 30,
                        color: whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "/day",
                      style: TextStyle(
                        fontSize: 15,
                        color: whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    DiscardNow(car, context);
                  },
                  //elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Discard",
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  color: orangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}

void DiscardNow(Car car, context) {
  FirebaseFirestore.instance
      .collection('cars')
      .doc(car.docId)
      .update({'rentedEmail': "none"});
  FirebaseFirestore.instance
      .collection('cars')
      .doc(car.docId)
      .update({'isRented': "false"});
  Fluttertoast.showToast(
      msg: "Discard Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => RentedPage(email: userEmail),
    ),
    (Route<dynamic> route) => false,
  );
}
