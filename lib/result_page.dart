import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:number_guess_app/main.dart';
import 'package:number_guess_app/result_button_page.dart';

import 'constants.dart';

class ResultPage extends StatefulWidget {
  ResultPage(this.counter);
  final int counter;

  @override
  ResultPageState createState() => ResultPageState(counter);
}

class ResultPageState extends State<ResultPage> {
  // 紙吹雪吹かせるためのコントローラ
  final _controller = ConfettiController(duration: const Duration(seconds: 30));

  ResultPageState(this.counter);
  final int counter;

  @override
//  紙吹雪吹かせてる
  void initState() {
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height:  MediaQuery.of(context).size.height,
        // 背景画像
        decoration: resultBackgroundDecoration,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 紙吹雪ここで出してる
                ConfettiWidget(
                  confettiController: _controller,
                  emissionFrequency: 0.5,
                  blastDirectionality: BlastDirectionality.explosive,
                ),
              ],
            ),
            // 結果発表
            Container(
              margin: EdgeInsets.only(top: 350),
              child: Column(
                children: [
                  Text(
                    "あなたの回数は$counter回です！",
                    style: resultTextStyle,
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // リトライ
                      resultPageButton(
                        buttonText: 'リトライ',
                        icon: Icons.autorenew,
                        onPressed: () {
                          // ホームの前までpopして、そこにゲーム画面を差し込む
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/game", ModalRoute.withName("/"));
                        },
                      ),
                      // ホームに戻るボタン
                      resultPageButton(
                        buttonText: 'ホーム',
                        icon: Icons.home,
                        onPressed: () {
                          // ホームまで一括でポップする
                          // Navigator.of(context).popUntil(ModalRoute.withName("/"));

                          // スタックを全部ぶっ飛ばしてホームのページに画面遷移する戻らないからキーボードでないんじゃね
                          Navigator.of(context,)
                              .pushNamedAndRemoveUntil('/', (route) => false);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
