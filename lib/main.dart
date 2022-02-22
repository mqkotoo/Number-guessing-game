import 'package:flutter/material.dart';
import 'package:number_guess_app/game_page.dart';
import 'how_to_play.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes:{
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title = 'NUMBER GUESSING GAME';



  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(title),
          automaticallyImplyLeading: false,
        ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50,115,50,115),
        //ここから中身のコードを書く　コンテナ
        child: Container(

          // height: 550,
          // width: 360,

          // レスポンシブ対応版
          height: deviceHeight / 1.6,
          width: deviceWidth * 0.8,

          //UIの枠
          // decoration: BoxDecoration(
          // border: Border.all(color: Colors.black),
          // ),
        child:Column(
          children: [
            Text("数当てゲームへようこそ",
              textAlign: TextAlign.center,
              style: TextStyle(
                backgroundColor: Colors.redAccent,
                color: Colors.white,
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0,
              ),
            ),
            //スタートボタンの処理
            Padding(
              padding: const EdgeInsets.only(top: 145),
              child: SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                  //  スタートボタンを押した時の画面遷移
                    Navigator.push(
                      context,
                      // MaterialPageRoute(builder: (context) => const GamePage(inputText: null,)),
                      MaterialPageRoute(builder: (context) => const GamePage()),
                    );
                  },
                  child: Text(
                    "スタート",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45, //ボタンの背景色
                  ),
                ),
              ),
            ),
            //遊び方ボタンの処理
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                  //  遊び方ボタンを押したときの画面遷移
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HowToPlay()),
                    );
                  },
                  child: Text(
                    "遊び方",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45, //ボタンの背景色
                  ),
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


