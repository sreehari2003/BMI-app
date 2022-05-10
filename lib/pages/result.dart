import 'package:flutter/material.dart';
import "../components/containers.dart";
import "../main.dart";

class Results extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final bmi;
  // ignore: prefer_typing_uninitialized_variables
  final results;
  const Results({Key? key, required this.bmi, required this.results})
      : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0a0E21),
        // centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          const Text(
            "Your Result",
            style: TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: const Color(0xFF1D1E33),
            ),
            height: 450,
            width: 340,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "NORMAL",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.bmi,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 89,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.results + " BMI range ",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "You have a normal body weight ,good job",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Boxes(
            width: 430,
            height: 60,
            margin: 1,
            color: Colors.red,
            child: TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Center(
                child: Text(
                  "Recalculate Your BMI",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
