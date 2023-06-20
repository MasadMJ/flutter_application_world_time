// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_multi_page/resources/api.dart';

class CardWidget extends StatefulWidget {
  String name;

  CardWidget({super.key, required this.name});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool dayTime = false;

  getInfo() async {
    ApiReq newReq = ApiReq(countryName: widget.name);
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
        title: Text(widget.name.replaceFirst(widget.name.substring(0, 1),
            widget.name.substring(0, 1).toUpperCase())),
        leading: CircleAvatar(
          backgroundImage: AssetImage("lib/assets/${widget.name}.png"),
          radius: 20,
          foregroundColor: Colors.amber,
        ),
      ),
    );
  }
}
