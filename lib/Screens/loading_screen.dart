import 'package:flutter/material.dart';
import 'package:rickandmortyapp/Widgets/widgets.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

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
      body: Stack(
        children: const [
          Background(),
          Center(
            child: CircularProgressIndicator(color: Color(0xffFFF1BD)),
          ),
        ],
      ),
    );
  }
}
