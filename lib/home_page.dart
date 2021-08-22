import 'dart:async';
import 'dart:math';
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

  List<int> food = [];

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

  bool mouthClosed = false;
  bool preGame = true;

  void startGame() {
    preGame = false;
    getFood();
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      mouthClosed = !mouthClosed;
      if (food.contains(player)) {
        food.remove(player);
      }
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

  void getFood() {
    for (int i=0; i<numberOfSquares; i++) {
      if (!barriers.contains(i)) {
        food.add(i);
      }
    }
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
                      switch (direction) {
                        case 'left':
                          return Transform.rotate(
                            angle: pi,
                            child: const MyPlayer(),
                          );
                        case 'right':
                          return const MyPlayer();
                        case 'up':
                          return Transform.rotate(
                            angle: 3 * pi / 2,
                            child: const MyPlayer(),
                          );
                        case 'down':
                          return Transform.rotate(
                            angle: pi / 2,
                            child: const MyPlayer(),
                          );
                        default:
                          return const MyPlayer();
                      }
                    } else if (barriers.contains(index)) {
                      return MyPixel(
                        innerColor: Colors.blue[800],
                        outerColor: Colors.blue[900],
                      );
                    } else {
                      return MyPath(
                        innerColor: Colors.yellow,
                        outerColor: Colors.black,
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
