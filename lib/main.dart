import 'package:flutter/material.dart';
import "./components/containers.dart";

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF0a0E21),
        scaffoldBackgroundColor: const Color(0xFF0a0E21),
        textTheme: const TextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void changeUser(Users selected) {
    if (selected == Users.male) {
      setState(() {
        if (male) {
          activeColor = const Color(0xFF1D1E33);
          activeFemale = const Color(0xFF1D1E33);
          male = false;
          female = false;
        } else {
          activeColor = Colors.red;
          activeFemale = const Color(0xFF1D1E33);
          male = true;
          female = false;
        }
      });
    } else {
      setState(() {
        if (female) {
          activeFemale = const Color(0xFF1D1E33);
          activeColor = const Color(0xFF1D1E33);
          female = false;
          male = false;
        } else {
          activeFemale = Colors.red;
          activeColor = const Color(0xFF1D1E33);
          female = true;
          male = false;
        }
      });
    }
  }

  int _value = 6;
  var male = false;
  var female = false;

  var activeColor = const Color(0xFF1D1E33);
  var activeFemale = const Color(0xFF1D1E33);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0a0E21),
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return Column(
          children: [
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        changeUser(Users.male);
                      },
                      child: Boxes(
                        width: 170,
                        height: 150,
                        margin: 15,
                        color: activeColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              "male",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 60),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        changeUser(Users.female);
                      },
                      child: Boxes(
                        width: 170,
                        height: 150,
                        margin: 12,
                        color: activeFemale,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              "female",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Boxes(
              width: 500,
              height: 140,
              margin: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Height",
                    style: TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _value.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 35),
                      ),
                      const Text(
                        "cm",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 100,
                    value: _value.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        _value = value.round();
                      });
                    },
                    inactiveColor: Colors.grey,
                    activeColor: Colors.red,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Boxes(
                    width: 170,
                    height: 150,
                    margin: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Weight",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          "74",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )
                      ],
                    )),
                Boxes(
                  width: 170,
                  height: 150,
                  margin: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Age",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "18",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                )
              ],
            ),
            // Boxes(),
            Boxes(
              width: 430,
              height: 60,
              margin: 1,
              color: Colors.red,
              child: TextButton(
                onPressed: () {},
                child: const Center(
                  child: Text(
                    "Calculate Your BMI",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

enum Users {
  male,
  female,
}
