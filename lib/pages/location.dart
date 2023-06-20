import 'package:flutter/material.dart';
import '../widget/card.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List countryLIST = [
    CardCountry(
      countryName: "Egypt - Cairo",
      flag: "egypt",
    ),
    CardCountry(countryName: "Moroco - Cairo", flag: "morocco"),
    CardCountry(countryName: "Saudi Arabia - Riyadh", flag: "sa"),
    CardCountry(countryName: "Canada - Toronto", flag: "canada"),
    CardCountry(countryName: "Algeria - Algiers", flag: "algeria"),
    CardCountry(countryName: "Australia - Sydney", flag: "australia"),
    CardCountry(countryName: "Tunisia - Tunis", flag: "tunisia")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose Location",
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: const Color.fromARGB(255, 87, 85, 85),
        centerTitle: false,
      ),
      backgroundColor: const Color.fromARGB(245, 199, 192, 192),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: double.infinity,
              child: ListView.builder(
                  itemCount: countryLIST.length,
                  itemBuilder: (BuildContext context, int index) {
                    return countryLIST[index];
                  }),
            )),
      ),
    );
  }
}
