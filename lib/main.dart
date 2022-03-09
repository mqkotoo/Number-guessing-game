import 'package:flutter/material.dart';
import 'package:number_guess_app/game_page.dart';
import 'constants.dart';
import 'how_to_play.dart';
import 'main_button.dart';

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
      routes: {
        '/home': (context) => MyHomePage(),
        '/game': (context) => const GamePage(),
        '/how' : (context) => HowToPlay(),
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
        padding: EdgeInsets.fromLTRB(50, 115, 50, 115),
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
          child: Column(
            children: [
              Text(
                "数当てゲームへようこそ",
                textAlign: TextAlign.center,
                style: homeTitleStyle,
              ),
              //スタートボタンの処理
              Padding(
                padding: const EdgeInsets.only(top: 145),
                child: mainButton(
                  buttonText: 'スタート',
                  pageNavigation: '/game',
                ),
              ),
              //遊び方ボタンの処理
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: mainButton(
                  buttonText: '遊び方',
                  pageNavigation: '/how',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
