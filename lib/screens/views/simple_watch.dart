import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class simple_watch extends StatefulWidget {
  const simple_watch({Key? key}) : super(key: key);

  @override
  State<simple_watch> createState() => _simple_watchState();
}

class _simple_watchState extends State<simple_watch> {
  int s = 0;
  int m = 0;
  int h = 0;

  myTime() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        s = DateTime.now().second;
        m = DateTime.now().minute;
        h = DateTime.now().hour;
      });
      myTime();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myTime();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Simple Watch"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ...List.generate(
                60,
                (index) => Transform.rotate(
                  angle: (index / 60) * (3*pi/2 * 2),
                  child: Divider(
                    thickness: (index % 5 == 0) ? 5 : 2,
                    endIndent: w * 0.95,
                    color: (index % 5 == 0) ? Colors.red : Colors.yellow,
                  ),
                ),
              ),
              //second
              Transform.rotate(
                angle: 3*pi/2,
                child: Transform.rotate(
                  angle: (s / 60) * (3*pi/2 / 2),
                  child: Divider(
                    thickness: 4,
                    color: Colors.blue,
                    indent: w * 0.5,
                    endIndent: 20,
                  ),
                ),
              ),
              //minutes
              Transform.rotate(
                angle: 3*pi/2,
                child: Transform.rotate(
                  angle: (m / 60) * (3*pi/2 / 2),
                  child: Divider(
                    thickness: 4,
                    color: Colors.blueAccent,
                    indent: w * 0.5,
                    endIndent: 50,
                  ),
                ),
              ),
              //hour
              Transform.rotate(
                angle: 3*pi/2,
                child: Transform.rotate(
                  angle: (h / 12) * (3*pi/2 / 2),
                  child: Divider(
                    thickness: 4,
                    color: Colors.lightBlue,
                    indent: w * 0.5,
                    endIndent: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
