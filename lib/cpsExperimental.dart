import 'dart:async';

import 'package:flutter/material.dart';

class CPS extends StatefulWidget {
  const CPS({super.key});

  @override
  State<CPS> createState() => _CPS();
}

class _CPS extends State<CPS> {
  int cps = 0;
  int hCps = 0;

  void time(){
    Timer(Duration(seconds: 1), time);

    setState(() {
      cps = 0;
    });
  }

  void reset(){
    setState(() {
      hCps = 0;
    });
  }

  void click(){
    setState(() {
      cps++;

      if(cps > hCps){
        hCps = cps;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("CPS: $cps"),
            FloatingActionButton.large(
              child: Text("TAP"),
              onPressed: () {
                click();
              },
            ),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text("Start"),
              onPressed: (){
                time();
              },
            ),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text("Reset"),
              onPressed: (){
                reset();
              },
            ),
            SizedBox(height: 128),
            Text(
              "Highest CPS: $hCps",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ),
      )
    );
  }
}