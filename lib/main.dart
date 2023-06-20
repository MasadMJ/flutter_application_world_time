import 'package:flutter/material.dart';
import 'package:flutter_application_multi_page/pages/loading.dart';
import 'package:flutter_application_multi_page/pages/home.dart';
import 'package:flutter_application_multi_page/pages/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const LoadingPage(),
        "/home": (context) => const HomePage(),
        "/location": (context) => const LocationPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
