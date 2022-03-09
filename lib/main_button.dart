


import 'package:flutter/material.dart';

class mainButton extends StatelessWidget {
  mainButton({required this.buttonText,required this.pageNavigation});

  final String buttonText;
  final String pageNavigation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context,
              pageNavigation,
          );
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black45, //ボタンの背景色
        ),
      ),
    );
  }
}