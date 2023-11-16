import 'package:flutter/material.dart';
import 'package:roller_dice_app/roller_dicer.dart';

  const beginAlignment = Alignment.topLeft;
  const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      appBar: AppBar(
       backgroundColor:Color.fromARGB(255, 174, 141, 107),
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
        child: const Center(child: RollerDice()),
      ),
    );
  }
}