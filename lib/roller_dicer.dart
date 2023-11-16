import 'dart:math';

import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  var diceNumber = 1;
  int playerOneState = 0;
  int playerTwoState = 0;
  List<int> playerOne = [];
  List<int> playerTwo = [];
  bool isPlayerOneButtonDisabled = false;
  bool isPlayerTwoButtonDisabled = false;
  int roundCounter = 0;

  late Widget playerOneButton;
  late Widget playerTwoButton;

  void roll1() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOne.add(diceNumber);
      isPlayerOneButtonDisabled = true;
      isPlayerTwoButtonDisabled = false;
    });
  }

  void roll2() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwo.add(diceNumber);
      isPlayerOneButtonDisabled = false;
      isPlayerTwoButtonDisabled = true;
    });
  }

  void checkGameResult() {
    roundCounter++;
    if (roundCounter < 5) {
    } else {
      int totalPlayerOneDiceValue =
          playerOne.reduce((value, element) => value + element);
      int totalPlayerTwoDiceValue =
          playerTwo.reduce((value, element) => value + element);

      String winnerMessage;

      if (totalPlayerOneDiceValue > totalPlayerTwoDiceValue) {
        winnerMessage = 'Player One Wins! \n\tDo you want to play again?';
      } else if (totalPlayerOneDiceValue < totalPlayerTwoDiceValue) {
        winnerMessage = 'Player Two Wins! \n\tDo you want to play again?';
      } else {
        winnerMessage = 'It\'s a Tie! \n\tDo you want to play again?';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text(winnerMessage),
            actions: [
              TextButton(
                onPressed: () {
                  navigateToMainMenu();
                },
                child: const Text('Main Menu'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      resetGame();
    }
  }

  void resetGame() {
    setState(() {
      roundCounter = 0;
      isPlayerOneButtonDisabled = false;
      isPlayerTwoButtonDisabled = false;
      diceNumber = 1;
      playerOne.clear();
      playerTwo.clear();
    });
  }

  void navigateToMainMenu() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assests/images/dice-$diceNumber.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            playerOneButton = TextButton(
                onPressed: isPlayerOneButtonDisabled
                    ? null
                    : () {
                        roll1();
                      },
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 219, 114, 8),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                child: const Text('Player One')),
            const SizedBox(
              width: 20,
            ),
            playerTwoButton = TextButton(
                onPressed: isPlayerTwoButtonDisabled
                    ? null
                    : () {
                        roll2();
                        checkGameResult();
                      },
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 219, 114, 8),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                child: const Text('Player Two')),
          ],
        )
      ],
    );
  }
}
