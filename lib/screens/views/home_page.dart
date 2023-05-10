import 'package:clock_app/screens/views/simple_watch.dart';
import 'package:clock_app/screens/views/smart_watch.dart';
import 'package:clock_app/screens/views/strap_watch.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Clock's"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('simple_watch');
              },
              child: const Text("Simple Watch"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('strap_watch');
              },
              child: const Text("Strap Watch"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('smart_watch');
              },
              child: const Text("Smart Watch"),
            )
          ],
        ),
      ),
    );
  }
}
