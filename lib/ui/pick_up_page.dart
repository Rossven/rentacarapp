import 'dart:developer';
import 'package:car_rent/car.dart';
import 'package:car_rent/components/colors.dart';
import 'package:car_rent/components/logo.dart';
import 'package:car_rent/components/text_fields.dart';
import 'package:car_rent/ui/brands_page.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import "package:collection/collection.dart";

dynamic City;
dynamic Date;

class PickUpPage extends StatelessWidget {
  const PickUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blackColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rentaCarLogo(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  children: const [
                    Text(
                      "Pick-Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  children: const [
                    Text(
                      "Location",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: FutureBuilder<List<Car>>(
                          future: readCars().first,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("");
                            } else {
                              final cars = snapshot.data!;

                              var locs = groupBy(cars, (Car e) {
                                return e.location;
                              });
                              print(locs.keys);
                              var loc =
                                  new List<String>.from(locs.keys.toList());

                              return DropdownSearch<String>(
                                popupProps: PopupProps.menu(
                                  showSelectedItems: true,
                                ),
                                items: loc,
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: "Select city",
                                ),
                                onChanged: (data) {
                                  gonder(data.toString());
                                },
                              );
                            }
                          }))),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Row(
                  children: const [
                    Text(
                      "Date",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
                child: SfDateRangePicker(
                  enablePastDates: false,
                  backgroundColor: whiteColor,
                  todayHighlightColor: orangeColor,
                  selectionColor: orangeColor,
                  rangeSelectionColor: orangeColor,
                  startRangeSelectionColor: orangeColor,
                  endRangeSelectionColor: orangeColor,
                  onSelectionChanged: _onSelectionChanged,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Show available cars",
                        style: TextStyle(
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          if (Date != null && City != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    BrandsPage(cardate: Date, carcity: City),
                              ),
                            );
                          }
                        },
                        child: Container(
                          child: const Icon(Icons.arrow_forward),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: orangeColor,
                                spreadRadius: 15,
                                blurRadius: 30,
                              )
                            ],
                          ),
                        ),
                        backgroundColor: orangeColor,
                        foregroundColor: whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(args.value);
    Date = args.value.toString();
  }

  void gonder(String a) {
    print(a);
    City = a.toString();
  }
}
