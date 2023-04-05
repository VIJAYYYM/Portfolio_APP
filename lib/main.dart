import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Gender(icon: Icons.male, text: "MALE"),
                  Gender(icon: Icons.female, text: "FEMALE")
                ],
              ),
              RandomWidget2(text1: "WEIGHT", text2: "66in", text3: "5\' 6\""),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RandomWidget(
                    text1: "WEIGHT",
                    text2: "140lb",
                  ),
                  RandomWidget(
                    text1: "AGE",
                    text2: "18",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Gender extends StatelessWidget {
  final IconData icon;
  final String text;
  const Gender({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 50),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class RandomWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const RandomWidget({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            text2,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIcon(icon: Icons.remove),
              CustomIcon(icon: Icons.add)
            ],
          )
        ],
      ),
    );
    ;
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Center(
          child: Icon(
        icon,
        color: Colors.black,
      )),
    );
  }
}

class RandomWidget2 extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  double value;
  RandomWidget2(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      this.value = 0});

  @override
  State<RandomWidget2> createState() => _RandomWidget2State();
}

class _RandomWidget2State extends State<RandomWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            widget.text1,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            widget.text2,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            widget.text3,
            style: TextStyle(color: Colors.white),
          ),
          Slider(
              inactiveColor: Colors.white,
              activeColor: Colors.white,
              value: widget.value,
              onChanged: (newValue) {
                setState(() {
                  widget.value = newValue;
                });
              })
        ],
      ),
    );
  }
}
