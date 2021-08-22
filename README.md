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
