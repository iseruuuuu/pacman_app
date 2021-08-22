# pacman_app

# 自分用のメモ. 

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

