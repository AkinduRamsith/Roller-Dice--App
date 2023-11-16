import 'package:flutter/material.dart';

import 'gradient_container.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void newGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GradientContainer(colors: [
          Color.fromARGB(255, 203, 180, 9),
          Color.fromARGB(255, 78, 68, 6),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 200,
        ),
        
      
       
        FilledButton(
          onPressed: newGame,
          style: FilledButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 219, 114, 8),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28,fontStyle: FontStyle.italic),
               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              ),
           
          child: const Text('Play New Game'),
        ),
      ],
    );
  }
}
