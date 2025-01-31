import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  int index;

  Function onButtonClick;

  BoardButton(
      {required this.text, required this.index, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    onButtonClick(index);
                  },
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 30),
                  ))),
        ],
      ),
    );
  }
}
