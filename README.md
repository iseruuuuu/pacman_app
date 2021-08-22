
完成品　ーーー　未完成だけど、いいアウトプットになりました。  

<img src = "https://user-images.githubusercontent.com/67954894/130353773-3fe0f898-7111-400d-a6fb-4597eb9645b9.png" width = 20%>




途中経過①.   


<img src = "https://user-images.githubusercontent.com/67954894/130342578-a286bcea-cda6-4998-9231-c53e0bbb2068.png" width = 20%>



```
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
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
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      color: Colors.grey,
                      child: Center(child: Text(index.toString())),
                    ),
                  );
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

```

途中経過②.　　　　

<img src = "https://user-images.githubusercontent.com/67954894/130343647-5ccad039-4804-4f3d-8aa2-8d48374d8cc9.png" width = 20%>


```

import 'package:flutter/material.dart';
import 'package:pacman_app/pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;

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
                  if (barriers.contains(index)) {
                   return MyPixel(
                      innerColor: Colors.blue[800],
                      outerColor: Colors.blue[900],
                      child: Text(index.toString()),
                    );
                  } else {
                   return MyPixel(
                      innerColor: Colors.yellow,
                      outerColor: Colors.black,
                      child: Text(index.toString()),
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



import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  const MyPixel({
    Key? key,
    this.innerColor,
    this.outerColor,
    this.child,
  }) : super(key: key);

  final innerColor;
  final outerColor;
  final child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(4),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(4),
              color: innerColor,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}

```


途中経過③.　　　　  

<img src = "https://user-images.githubusercontent.com/67954894/130344296-8d91a380-a0e7-4695-b229-890b0c1215cb.png" width = 20%>

```
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

import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget {
  const MyPixel({
    Key? key,
    this.innerColor,
    this.outerColor,
    this.child,
  }) : super(key: key);

  final innerColor;
  final outerColor;
  final child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(4),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: innerColor,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyPath extends StatelessWidget {
  const MyPath({
    Key? key,
    this.innerColor,
    this.outerColor,
    this.child,
  }) : super(key: key);

  final innerColor;
  final outerColor;
  final child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(12),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: innerColor,
                child: Center(child: child)),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  const MyPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        'assets/images/1.png',
      ),
    );
  }
}

```




途中経過④　　　　　.　　　　　　　

<img src = "https://user-images.githubusercontent.com/67954894/130344863-ef72d2e8-36ec-4fbd-b742-8c25d4d558ca.png" width = 20%>

```
import 'dart:async';

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

  String direction = 'right';

  List<int> barriers = [
    //枠の周りの値
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165,
    176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186,
    175, 164, 153, 142, 131, 120, 109, 98, 87, 76, 65, 54, 43, 32, 21,
    //上の青色
    24, 26, 28, 30,
    35, 37, 38, 39, 41,
    46, 52, 57, 59, 61, 63,
    70, 72,
    78, 79, 80, 81, 83, 84, 85, 86, 87, 88,
    //下の青色
    100, 101, 102, 103, 106, 105, 107, 108, 109,
    114, 116,
    123, 125, 127, 129,
    134, 140,
    145, 147, 148, 149, 151,
    156, 158, 160, 162,
  ];

  void startGame() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      switch (direction) {
        case 'left':
          moveLeft();
          break;
        case 'right':
          moveRight();
          break;
        case 'up':
          moveUp();
          break;
        case 'down':
          moveDown();
          break;
      }
    });
  }

  void moveLeft() {
    if (!barriers.contains(player - 1)) {
      setState(() {
        player--;
      });
    }
  }

  void moveRight() {
    if (!barriers.contains(player + 1)) {
      setState(() {
        player++;
      });
    }
  }

  void moveUp() {
    if (!barriers.contains(player - numberInRow)) {
      setState(() {
        player -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (!barriers.contains(player + numberInRow)) {
      setState(() {
        player += numberInRow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  direction = 'down';
                } else if (details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0) {
                  direction = 'right';
                } else if (details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: Container(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberInRow,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (player == index) {
                      return MyPlayer();
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
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Score: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: startGame,
                    child: const Text(
                      'PLAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

