import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(ScoreCount());
}

class ScoreCount extends StatelessWidget {
  const ScoreCount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Score App",
      home: Score(),
    );
  }
}

class Score extends StatefulWidget {
  const Score({super.key});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  int _Count = 0;
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score App"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 86, 65, 3),
      ),
      //...............tala action button chaiyema ..............................
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _Count = _Count + 1;
      //     });
      //   },
      //   backgroundColor: Color.fromARGB(255, 122, 92, 3),
      //   child: Icon(Icons.add),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 65,
          ),
          Center(
            child: Text(
              "Score is ",
              style: TextStyle(
                color: Colors.green,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Center(
            child: Text(
              "$_Count",
              style: TextStyle(
                color: Colors.green,
                fontSize: 95,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
                    setState(() {
                      _Count = _Count + 1;
                    });
                  });
                },
                icon: Icon(Icons.start),
                color: Color.fromARGB(255, 106, 80, 2),
                iconSize: 50,
              ),
              IconButton(
                onPressed: () {
                  if (_timer?.isActive ?? false) {
                    _timer?.cancel();
                  }
                },
                icon: Icon(Icons.stop),
                color: Color.fromARGB(255, 106, 80, 2),
                iconSize: 50,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _Count = 0;
                  });
                },
                icon: Icon(Icons.refresh),
                color: Color.fromARGB(255, 106, 80, 2),
                iconSize: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
