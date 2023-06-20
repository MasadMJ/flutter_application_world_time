// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/api.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  String myTime = "";
  bool dayTime = false;
  getInfo() async {
    ApiReq newReq = ApiReq(flag: "egypt");
    await newReq.getIsraelInfo();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "time": newReq.myTime,
      "timezone": newReq.timezone,
      "dayTime": newReq.isDay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SpinKitDualRing(
                color: Colors.black,
                size: 50.0,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
