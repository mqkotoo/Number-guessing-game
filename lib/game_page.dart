import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:number_guess_app/result_page.dart';


class GamePage extends StatefulWidget {


  const GamePage({Key? key,}) : super(key: key);

//  ここから下にOVERRIDE
  @override
  // _GamePageState createState() => _GamePageState(inputText);
  _GamePageState createState() => _GamePageState();
}

class Styles {
  static const HintStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.red,
  );
}

class _GamePageState extends State<GamePage> {


  int _counter = 0;

  final _formKey = GlobalKey<FormState>();

  var myController = TextEditingController();



  late FocusNode addAnswerFocusNode;

  int inputText = 0 ;

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
    // リトライした時にもう一回ランダムな答えを生成する
    //   answer = Random().nextInt(101) + 1;
    //   _counter = 0;
      // inputText = 0 ;
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
          //UIの枠
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.black),
          // ),
          child: Column(
            children: [
              Text(
                "答えを予想してください!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 31,
                  color: Colors.black,
                ),
              ),
              //回答を決定したときにその答えのヒントを出力する　条件分岐
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child:
                game(),
              ),

              //回答を入力するフォーム↓
              Padding(
                padding: const EdgeInsets.only(top: 26),

                child: Form(
                  key: _formKey,
                  child: TextFormField(

                    onEditingComplete: () async {
                      // myController.clear();
                      // unfocus()を呼び出して、フォーカスを外す
                      addAnswerFocusNode.unfocus();
                    },
                    controller: myController,
                    focusNode: addAnswerFocusNode,

                    //バリデーションしたい　↓
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '何か数字を入力してください';
                      }else if (int.parse(value) > 100){
                        return '100以内の数字を入力してください';
                      }
                      return null;
                    },
                    maxLength: 3,
                    // キーボードは数値のみ
                    keyboardType: TextInputType.number,
                    // フォームの装飾を定義
                    decoration: InputDecoration(
                      labelText: "1〜100までの数値を入力し"
                          "ください。",
                      hintText: '例（58）',
                      fillColor: Colors.black,
                    ),
                  ),
                ),
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
                      _counter ++;
                    }
                    // _incrementCounter(myController.text);
                    myController.clear();
                    if (inputText == answer){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultPage(
                          _counter,
                        )),
                      );
                    }
                  },
                  child: Text(
                    "送信する",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
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
      if (guess > 100 ){
        return Text("100より小さい数っていっとるやんけ",
          style: Styles.HintStyle,
        );
      }
    else if (guess > answer) {
      return Text("$inputTextより小さいです！",
        style: Styles.HintStyle,
      );
    }else if (guess == 0){
      return Text("");
    } else if (guess < answer) {
        return Text("$inputTextより大きいです！",
          style: Styles.HintStyle,
        );
      }
    }
  }
}