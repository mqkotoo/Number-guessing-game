import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("このゲームの遊び方"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
              width:deviceWidth * 0.8,
            //文字書くところの枠
            // decoration: BoxDecoration(
            // border: Border.all(color: Colors.black),
            // ),
            //説明文
            child: Column(
              children: [
                Text("このゲームは実に単純で簡単なゲームだ。\nまず1から100までのランダムな数字が\n答えとして設定される。\nそれをいかに少ない回数で\n答えまでたどり着くかのゲームなのだ。",
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                    height: 3,
                 ),
                ),
                //ホームに戻るボタン
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        //  ボタンを押した時の画面遷移
                        Navigator.pop(context);
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
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}