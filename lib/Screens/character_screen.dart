import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff146356),
        title: const Text(
          "Rick and Morty App",
          // style: TextStyle(color: Color(0xffFFF1BD)),
        ),
      ),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
