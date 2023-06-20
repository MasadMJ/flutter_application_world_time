// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ApiReq {
  bool isDay = false;
  late String myTime;
  late String countryName;
  late String timezone;

  ApiReq({required this.countryName});

  getIsraelInfo() async {
    switch (countryName) {
      case 'egypt':
        timezone = 'Africa/Cairo';
        break;
      case 'israel':
        timezone = 'Asia/Jerusalem';
        break;
      case 'morocco':
        timezone = 'Africa/Casablanca';
        break;
      case 'sa':
        timezone = 'Asia/Riyadh';
        break;
      case 'tunisia':
        timezone = 'Africa/Tunis';
        break;
      case 'algeria':
        timezone = 'Africa/Algiers';
        break;
      case 'australia':
        timezone = 'Australia/Sydney';
        break;
      case 'canada':
        timezone = 'America/Toronto';
        break;
      default:
        timezone = 'Asia/Jerusalem';
        break;
    }
    try {
      var url = Uri.parse("http://worldtimeapi.org/api/timezone/$timezone");
      Response response = await get(url);
      Map receivedData = jsonDecode(response.body);
      DateTime myDate = DateTime.parse(receivedData['utc_datetime']);
      int difTime =
          int.parse(receivedData['utc_offset'].toString().substring(0, 3));
      myDate = myDate.add(Duration(hours: difTime));
      myTime = DateFormat('hh : mm a').format(myDate);
      if (myDate.hour > 5 && myDate.hour < 18) {
        isDay = true;
      }
    } catch (e) {
      isDay = false;
      myTime = e.toString();
      countryName = "";
      timezone = "";
    }
  }
}
