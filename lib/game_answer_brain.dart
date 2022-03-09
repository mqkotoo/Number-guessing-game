

import 'package:flutter/material.dart';

import 'constants.dart';

class answerInputFom extends StatelessWidget {
  const answerInputFom({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.addAnswerFocusNode,
    required this.myController,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final FocusNode addAnswerFocusNode;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Form(
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
        decoration: gameInputText,
      ),
    );
  }
}

