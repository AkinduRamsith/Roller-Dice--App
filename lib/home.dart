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
  late TextEditingController controller1;
  late TextEditingController _controller2;
  String? playerOne;
  String? playerTwo;
  String? playerOneErrorText;
  String? playerTwoErrorText;
  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  void newGame() {
    setState(() {
      playerOneErrorText=_validateName(controller1.text);
      playerTwoErrorText=_validateName(_controller2.text);

  if (playerOneErrorText==null && playerTwoErrorText==null) {
  playerOne = controller1.text;
  playerTwo = _controller2.text;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GradientContainer(
        colors: const [
          Color.fromARGB(255, 203, 180, 9),
          Color.fromARGB(255, 78, 68, 6),
        ],
        playerOne: playerOne,
        playerTwo: playerTwo,
        onMainMenuPressed: () {
                
                controller1.clear();
                _controller2.clear();
                setState(() {
                  playerOneErrorText = null;
                  playerTwoErrorText = null;
                });
              },
      ),
    ),
  );
}
});
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a your name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 150,
        ),
        SizedBox(
          width: 250,
          child: TextField(
            obscureText: false,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Player One Name',
              errorText: playerOneErrorText,
            ),
            controller: controller1,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 250,
          child: TextField(
            controller: _controller2,
            obscureText: false,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Player Two Name',
              errorText: playerTwoErrorText,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FilledButton(
          onPressed: newGame,
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 219, 114, 8),
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 28, fontStyle: FontStyle.italic),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          child: const Text('Play New Game'),
        ),
      ],
    );
  }
}
