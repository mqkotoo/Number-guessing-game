import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:number_guess_app/main.dart';

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
        // 背景画像
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/result.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 紙吹雪ここで出してる
              ConfettiWidget(
                confettiController: _controller,
                emissionFrequency: 0.5,
                blastDirectionality: BlastDirectionality.explosive,
              ),

              // 結果発表
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Text("あなたの回数は$counter回です！",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black,
                    ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ホームに戻るボタン
                  SizedBox(
                    width: 160,
                    height: 45,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.autorenew,
                        color: Colors.white,
                      ),
                      label: const Text('リトライ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black45,
                      ),
                      onPressed: () {
                        //  ボタンを押した時の画面遷移
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // ホームに戻るボタン
                  SizedBox(
                    width: 155,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        //  ボタンを押した時の画面遷移
                        Navigator.of(context).pushReplacementNamed("/home");
                      },
                      child: Text(
                        "ホームに戻る",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}