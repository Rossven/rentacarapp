import 'package:car_rent/car.dart';
import 'package:car_rent/ui/brands_page.dart';
import 'package:car_rent/ui/car_detail.dart';
import 'package:car_rent/ui/first_page.dart';
import 'package:car_rent/ui/cars_page.dart';
import 'package:car_rent/ui/forgot_password_page.dart';
import 'package:car_rent/ui/pick_up_page.dart';
import 'package:car_rent/ui/rented_detail.dart';
import 'package:car_rent/ui/rented_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: "Rent A Car App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'NunitoSans'),
      home: WelcomePage(),
    ),
  );
}
