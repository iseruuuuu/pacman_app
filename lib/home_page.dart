import 'package:flutter/material.dart';
import 'package:pacman_app/path.dart';
import 'package:pacman_app/pixel.dart';
import 'package:pacman_app/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;

  int player = numberInRow * 15 + 1;

  List<int> barriers = [
    //枠の周りの値
    0,1,2,3,4,5,6,7,8,9,10,
    11,22, 33,44, 55,66, 77,88, 99,110, 121,132, 143,154, 165,
    176,177,178,179,180,181,182,183,184,185,186,
    175,164,153,142,131,120,109,98,87,76,65,54,43,32,21,
    //上の青色
    24,26,28,30,
    35,37,38,39,41,
    46,52,57,59,61,63,
    70,72,
    78,79,80,81,83,84,85,86,87,88,
    //下の青色
    100,101,102,103,106,105, 107,108,109,
    114,116,
    123,125,127,129,
    134,140,
    145,147,148,149,151,
    156,158,160,162,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if(player == index) {
                    return MyPlayer(

                    );
                  } else if (barriers.contains(index)) {
                   return MyPixel(
                      innerColor: Colors.blue[800],
                      outerColor: Colors.blue[900],
                      // child: Text(index.toString()),
                    );
                  } else {
                   return MyPath(
                      innerColor: Colors.yellow,
                      outerColor: Colors.black,
                      // child: Text(index.toString()),
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Score: ', style: TextStyle(color: Colors.white, fontSize: 40),),
                  Text('Play', style: TextStyle(color: Colors.white, fontSize: 40),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
