import 'package:flutter/material.dart';
import 'package:xo/boardbutton.dart';

class XoScreen extends StatefulWidget {
  @override
  State<XoScreen> createState() => _XoScreenState();
}

class _XoScreenState extends State<XoScreen> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'XoGames',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'player1(x)',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold, height: 8),
                    ),
                    Text(
                      '$player1Score',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'player1(o)',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 8,
                      ),
                    ),
                    Text(
                      '$player2Score',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[0],
                  index: 0,
                  onButtonClick: onButtonAction,
                ),
                BoardButton(
                  text: boardState[1],
                  index: 1,
                  onButtonClick: onButtonAction,
                ),
                BoardButton(
                  text: boardState[2],
                  index: 2,
                  onButtonClick: onButtonAction,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[3],
                  index: 3,
                  onButtonClick: onButtonAction,
                ),
                BoardButton(
                  text: boardState[4],
                  index: 4,
                  onButtonClick: onButtonAction,
                ),
                BoardButton(
                  text: boardState[5],
                  index: 5,
                  onButtonClick: onButtonAction,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[6],
                  index: 6,
                  onButtonClick: onButtonAction,
                ),
                BoardButton(
                  text: boardState[7],
                  index: 7,
                  onButtonClick: onButtonAction,
                ),
                BoardButton(
                  text: boardState[8],
                  index: 8,
                  onButtonClick: onButtonAction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0; // to track the player turn

  void onButtonAction(int index) {
    if (boardState[index].isNotEmpty) {
      return; // if the cell is already filled, do nothing
    }

    setState(() {
      if (counter % 2 == 0) {
        // Player X's turn
        boardState[index] = 'X';
      } else {
        // Player O's turn
        boardState[index] = 'O';
      }
      counter++;

      if (checkWinner('X')) {
        player1Score += 5;
        initBoard();
      } else if (checkWinner('O')) {
        player2Score += 5;
        initBoard();
      } else if (counter == 9) {
        initBoard();
      }
    });
  }

  bool checkWinner(String symbol) {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    // Check diagonals
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }

    return false;
  }

  void initBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }
}

class XoGameArgs {
  //data class / data model
  String playerXname;
  String playerOname;

  XoGameArgs({required this.playerXname, required this.playerOname});
}
