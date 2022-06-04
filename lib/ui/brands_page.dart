import 'package:car_rent/components/car_brands.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/logo.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final pathList = <String>[
  "assets/brands/aromeo.png",
  "assets/brands/aston.png",
  "assets/brands/audi.png",
  "assets/brands/bmw.png",
  "assets/brands/ford.png",
  "assets/brands/tesla.png",
  "assets/brands/honda.png",
  "assets/brands/volkswagen.png",
];

class BrandsPage extends StatelessWidget {
  final String cardate;
  final String carcity;

  const BrandsPage({Key? key, required this.cardate, required this.carcity})
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
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Brands",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Car>>(
              future: readCars().first,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Seçtiğiniz aralıklarda Araç bulunmamaktadır");
                } else {
                  final cars = snapshot.data!;

                  List<Car> updatedCars = cars
                      .where((element) =>
                          element.isRented == "false" &&
                          isDateOk(element, cardate) &&
                          element.location == carcity)
                      .toList();

                  print(updatedCars);
                  print(cardate);
                  print(carcity);

                  var locs = groupBy(
                      updatedCars.where(
                          (element) => element.isRented == "false"), (Car e) {
                    return e.carBrandImage;
                  });
                  print(locs.keys);
                  var loc = new List<String>.from(locs.keys.toList());

                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (1),
                    shrinkWrap: true,
                    //crossAxisSpacing: 5,
                    // mainAxisSpacing: 5,
                    physics: ScrollPhysics(),
                    //padding: EdgeInsets.all(10.0),
                    children: loc
                        .map((data) => Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  carBrands(data, carcity, cardate, context),
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

/*class BrandsPage extends StatefulWidget {
  final String cardate;
  final String carcity;

  const BrandsPage({Key? key, required this.cardate, required this.carcity})
      : super(key: key);

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

final pathList = <String>[
  "assets/brands/aromeo.png",
  "assets/brands/aston.png",
  "assets/brands/audi.png",
  "assets/brands/bmw.png",
  "assets/brands/ford.png",
  "assets/brands/tesla.png",
  "assets/brands/honda.png",
  "assets/brands/volkswagen.png",
]; // Creates growable list.

class _BrandsPageState extends State<BrandsPage> {
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
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carcity,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (1),
              shrinkWrap: true,
              //crossAxisSpacing: 5,
              // mainAxisSpacing: 5,
              physics: ScrollPhysics(),
              //padding: EdgeInsets.all(10.0),
              children: pathList
                  .map(
                    (data) => GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(16),

                          //  margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          //color:data.color,
                          child: Column(
                            children: [
                              carBrands(data, "bla", context),
                            ],
                          ),
                        )),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}*/
