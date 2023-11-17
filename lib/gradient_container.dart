import 'package:flutter/material.dart';
import 'package:roller_dice_app/roller_dicer.dart';

  const beginAlignment = Alignment.topLeft;
  const endAlignment = Alignment.bottomRight;

// ignore: must_be_immutable
class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, required this.colors,this.playerOne, this.playerTwo});
  final List<Color> colors;
 String? playerOne;
 String? playerTwo;

  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      appBar: AppBar(
       backgroundColor:const Color.fromARGB(255, 174, 141, 107),
           title: const Text(
            "iCET Roller Dice App",
            style: TextStyle(color: Colors.black),
          ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: colors,
          ),
        ),
        child: Center(child: RollerDice(playerOneName: playerOne,playerTwoName: playerTwo,)),
      ),
    );
  }
}
