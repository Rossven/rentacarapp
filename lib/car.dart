import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//gearbox and fuel

class Car {
  var price;
  var availableEnd;
  var availableStart;
  var carBrand;
  var carBrandImage;
  var carImage;
  var carModel;
  dynamic isRented;
  var location;
  var rentedEmail;
  var carGearbox;
  var carFuel;
  var docId;

/*pricec, availableEndc, availableStartc, carBrandc, carBrandImagec,
      carImagec, carModelc, isRentedc, locationc,*/

  // ignore: non_constant_identifier_names
  Car({
    required this.price,
    required this.availableEnd,
    required this.availableStart,
    required this.carBrand,
    required this.carBrandImage,
    required this.carImage,
    required this.carModel,
    required this.isRented,
    required this.location,
    required this.rentedEmail,
    required this.carGearbox,
    required this.carFuel,
    required this.docId,
  });
  /* price = pricec;
    availableEnd = availableEndc;
    availableStart = availableStartc;
    carBrand = carBrandc;
    carBrandImage = carBrandImagec;
    carImage = carImagec;
    carModel = carModelc;
    isRented = isRentedc;
    location = locationc;*/

  Map<String, dynamic> toJson() => {
        "Price": price,
        "availableEnd": availableEnd,
        "availableStart": availableStart,
        "carBrand": carBrand,
        "carBrandImage": carBrandImage,
        "carImage": carImage,
        "carModel": carModel,
        "isRented": isRented,
        "location": location,
        "rentedEmail": rentedEmail,
        "carGearbox": carGearbox,
        "carFuel": carFuel
      };

  static Car fromJson(Map<String, dynamic> json, String asd) => Car(
      price: json['Price'],
      availableEnd: json['availableEnd'],
      availableStart: json['availableStart'],
      carBrand: json['carBrand'],
      carBrandImage: json['carBrandImage'],
      carFuel: json['carFuel'],
      carGearbox: json['carGearbox'],
      carImage: json['carImage'],
      carModel: json['carModel'],
      isRented: json['isRented'],
      location: json['location'],
      rentedEmail: json['rentedEmail'],
      docId: asd);
}

Stream<List<Car>> readCars() =>
    FirebaseFirestore.instance.collection('cars').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Car.fromJson(doc.data(), doc.id)).toList());

Future<List<String>> readID() => FirebaseFirestore.instance
    .collection("cars")
    .get()
    .then((res) => res.docs.map((e) => e.id).toList());
//FirebaseFirestore db = FirebaseFirestore.instance;
var carList = <Car>[
  Car(
      price: "150",
      availableEnd: "2022-06-10 00:00:00.000",
      availableStart: "2022-06-07 00:00:00.000",
      carBrand: "BMW",
      carBrandImage: "assets/brands/bmw.png",
      carImage: "assets/cars/bmw_x5.png",
      carModel: "x5",
      isRented: false.toString(),
      location: "Ankara",
      rentedEmail: "",
      carGearbox: "Auto",
      carFuel: "Diesel",
      docId: "amam"),
  /*Car(
      "200",
      "2022-06-13 00:00:00.000",
      "2022-06-10 00:00:00.000",
      "BMW",
      "assets/brands/bmw.png",
      "assets/cars/bmw_sahte.png",
      "x6",
      false.toString(),
      "İstanbul"),
  Car(
      "250",
      "2022-06-15 00:00:00.000",
      "2022-06-13 00:00:00.000",
      "BMW",
      "assets/brands/bmw.png",
      "assets/cars/bmw_m3.png",
      "m3",
      false.toString(),
      "Ankara"),
  Car(
      "300",
      "2022-06-18 00:00:00.000",
      "2022-06-15 00:00:00.000",
      "BMW",
      "assets/brands/bmw.png",
      "assets/cars/bmw_x6.png",
      "x6",
      false.toString(),
      "İstanbul"),
  Car(
      "200",
      "2022-06-21 00:00:00.000",
      "2022-06-18 00:00:00.000",
      "Tesla",
      "assets/brands/tesla.png",
      "assets/cars/tesla_models.png",
      "models",
      false.toString(),
      "İstanbul"),
  Car(
      "275",
      "2022-06-24 00:00:00.000",
      "2022-06-21 00:00:00.000",
      "Tesla",
      "assets/brands/tesla.png",
      "assets/cars/tesla_modely.png",
      "modely",
      true.toString(),
      "Ankara"),
  Car(
      "350",
      "2022-06-27 00:00:00.000",
      "2022-06-24 00:00:00.000",
      "Tesla",
      "assets/brands/tesla.png",
      "assets/cars/tesla_model3.png",
      "model3",
      false.toString(),
      "İstanbul"),*/
];
