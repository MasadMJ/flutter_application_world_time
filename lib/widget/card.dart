// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_multi_page/resources/api.dart';

class CardCountry extends StatefulWidget {
  String countryName;
  String flag;


  CardCountry({super.key, required this.countryName,required this.flag});

  @override
  State<CardCountry> createState() => _CardCountryState();
}

class _CardCountryState extends State<CardCountry> {
  bool dayTime = false;

  getInfo() async {
    ApiReq newReq = ApiReq(flag: widget.flag);
    await newReq.getIsraelInfo();
    Navigator.pop(context, {
      "time": newReq.myTime,
      "timezone": newReq.timezone,
      "dayTime": newReq.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        onTap: () {
          getInfo();
        },
        title: Text(widget.countryName),
        leading: CircleAvatar(
          backgroundImage: AssetImage("lib/assets/${widget.flag}.png"),
          radius: 20,
          foregroundColor: Colors.amber,
        ),
      ),
    );
  }
}
