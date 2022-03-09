import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:number_guess_app/result_page.dart';
import 'constants.dart';
import 'game_answer_brain.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    Key? key,
  }) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  var myController = TextEditingController();
  late FocusNode addAnswerFocusNode;
  int inputText = 0;
  int answer = Random().nextInt(101) + 1;

  @override
  void initState() {
    super.initState();
    addAnswerFocusNode = FocusNode();
    myController = TextEditingController();
  }

  @override
  // widgetの破棄時にコントローラも破棄する
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Number Guessing!!"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 88, 30, 0),
        child: Container(
          height: 650,
          width: 600,
          child: Column(
            children: [
              Text(
                "答えを予想してください!",
                style: gameTextStyle,
              ),
              //回答を決定したときにその答えのヒントを出力する　条件分岐
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: game(),
              ),

              //回答を入力するフォーム↓
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: answerInputFom(
                    formKey: _formKey,
                    addAnswerFocusNode: addAnswerFocusNode,
                    myController: myController),
              ),

              //回答を送信するボタン　↓
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    //  送信ボタンを押したときの処理
                    setState(() {
                      try {
                        inputText = int.parse(myController.text);
                      } on FormatException {
                        print('Format error!');
                      }
                    });
                    //押したときのバリデーション含めた処理
                    if (_formKey.currentState!.validate()) {
                      _counter++;
                    }
                    // _incrementCounter(myController.text);
                    myController.clear();
                    if (inputText == answer) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ResultPage(
                                _counter,
                              ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "送信する",
                    style: submitTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45, //ボタンの背景色
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text? game() {
    print(answer);
    // int answer = Random().nextInt(101);
    int guess = inputText as int;

    while (guess != answer) {
      if (guess > 100) {
        return Text(
          "100より小さい数っていっとるやんけ",
          style: gameHintStyle,
        );
      } else if (guess > answer) {
        return Text(
          "$inputTextより小さいです！",
          style: gameHintStyle,
        );
      } else if (guess == 0) {
        return Text("");
      } else if (guess < answer) {
        return Text(
          "$inputTextより大きいです！",
          style: gameHintStyle,
        );
      }
    }
  }
}
