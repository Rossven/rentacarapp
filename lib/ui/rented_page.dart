import 'package:car_rent/components/car_brands.dart';
import 'package:car_rent/components/cars_card.dart';
import 'package:car_rent/components/rented_card.dart';
import 'package:car_rent/ui/first_page.dart';
import 'package:car_rent/ui/pick_up_page.dart';
import 'package:car_rent/ui/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/logo.dart';
import 'package:car_rent/car.dart';

class RentedPage extends StatelessWidget {
  final String email;
  const RentedPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                      Text(
                        "Rented Cars",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: whiteColor,
                          fontSize: 26,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _signOut(context);
                        },
                        style: TextButton.styleFrom(primary: orangeColor),
                        child: const Text(
                          "Log out",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<Car>>(
                  future: readCars().first,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("");
                    } else {
                      final cars = snapshot.data!;
                      //print(email);
                      // print(cars.elementAt(0).docId);

                      return GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: (2),
                        shrinkWrap: true,
                        //crossAxisSpacing: 5,
                        // mainAxisSpacing: 5,
                        physics: ScrollPhysics(),
                        //padding: EdgeInsets.all(10.0),
                        children: cars
                            .where((element) => element.rentedEmail == email)
                            .map((data) => Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      rentedCars(data, context),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PickUpPage()));
                  },
                  child: Container(
                    child: const Icon(Icons.add),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: orangeColor,
                          spreadRadius: 15,
                          blurRadius: 10,
                        )
                      ],
                    ),
                  ),
                  backgroundColor: orangeColor,
                  foregroundColor: whiteColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _signOut(context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
      (Route<dynamic> route) => false,
    );
  } catch (e) {
    throw Exception(e);
  }
}
