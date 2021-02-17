import 'dart:async';

import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool stopispressed = true;
  bool startispressed = true;
  bool resetispressed = true;
  String stoptimetodisplay = "00:00:00";
  final dur = const Duration(seconds: 1);
  var swatch = Stopwatch();

  void starttimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (swatch.isRunning) {
      starttimer();
    }
    setState(() {
      stoptimetodisplay = swatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  void stop() {
    setState(() {
      stopispressed = true;
      resetispressed = false;
    });
    swatch.stop();
  }

  void start() {
    setState(() {
      startispressed = false;
      stopispressed = false;
    });
    swatch.start();
    starttimer();
  }

  void reset() {
    setState(() {
      startispressed = true;
      resetispressed = true;
    });
    swatch.reset();
    stoptimetodisplay = "00:00:00";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Practical: 3'),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Chronometer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                stoptimetodisplay,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: stopispressed ? null : stop,
                  child: Text(
                    'Stop',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  color: Colors.red[400],
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  width: 50,
                ),
                RaisedButton(
                  onPressed: resetispressed ? null : reset,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: startispressed ? start : null,
              child: Text(
                'Start',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            ),
          ],
        ),
      ),
    );
  }
}
