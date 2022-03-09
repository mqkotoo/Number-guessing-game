import 'package:flutter/material.dart';

const homeTitleStyle = TextStyle(
  backgroundColor: Colors.redAccent,
  color: Colors.white,
  fontSize: 40,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
  letterSpacing: 4.0,
);

const gameHintStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: Colors.red,
);

const gameTextStyle = TextStyle(
  fontStyle: FontStyle.italic,
  fontSize: 31,
  color: Colors.black,
);

const gameInputText = InputDecoration(
  labelText: "1〜100までの数値を入力し"
      "ください。",
  hintText: '例（58）',
  fillColor: Colors.black,
);

const submitTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

const resultBackgroundDecoration = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/result.png'),
      fit: BoxFit.cover,
    )
);

const resultTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  color: Colors.black,
);