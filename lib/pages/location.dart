import 'package:flutter/material.dart';
import '../widget/card.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List countryLIST = [
    "egypt",
    "morocco",
    "sa",
    "tunisia",
    "algeria",
    "australia",
    "canada"
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
          child: Column(
            children: [
              for (String iteam in countryLIST)
                CardWidget(
                  name: iteam,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
