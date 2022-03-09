


import 'package:flutter/material.dart';

class resultPageButton extends StatelessWidget {
  resultPageButton({required this.onPressed,required this.buttonText,required this.icon});

  final void Function() onPressed;
  final String buttonText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 45,
      child: ElevatedButton.icon(
        onPressed: onPressed,
          //  ボタンを押した時の画面遷移
          // Navigator.of(context).pushNamedAndRemoveUntil("/game", ModalRoute.withName("/"));
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black45,
        ),
      ),
    );
  }
}