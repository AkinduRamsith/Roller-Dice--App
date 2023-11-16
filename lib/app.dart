import 'package:flutter/material.dart';
import 'package:roller_dice_app/home.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Color.fromARGB(255, 174, 141, 107),
           title: const Text(
            "iCET Roller Dice App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assests/images/background.jpg'),
                  fit: BoxFit.cover),
            ),
            child: const Column(
              children: [
                Center(child: Home()),
              ],
            )),
      ),
    );
  }
}
