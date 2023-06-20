import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map myData = {};
  Map myData2 = {};

  @override
  Widget build(BuildContext context) {
    myData.isEmpty
        ? myData = ModalRoute.of(context)?.settings.arguments as Map
        : myData = myData2;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(myData['dayTime']
                  ? "lib/assets/day.png"
                  : "lib/assets/night.png"),
              fit: BoxFit.cover),
          color: const Color.fromARGB(183, 0, 0, 0),
        ),
        width: double.infinity,
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  myData2 =
                      await Navigator.pushNamed(context, '/location') as Map;
                  setState(() {
                    //  myData2={"time":myData1['time'],"timezone":myData1['timezone'],"dayTime":myData1['dayTime']};
                  });
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(255, 255, 129, 129),
                  size: 24.0,
                ),
                label: const Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(146, 90, 104, 223)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              Container(
                width: double.infinity,
                color: const Color.fromARGB(183, 0, 0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                child: Column(
                  children: [
                    Text(
                      myData['time'],
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      myData['timezone'],
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
