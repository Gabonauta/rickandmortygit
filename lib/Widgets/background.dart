import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.8],
    colors: [Color(0xffF3C892), Color(0xffF3C892)],
  ));
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //Background gradiente morada
          decoration: boxDecoration,
        ),
        Positioned(
          top: -100,
          left: -30,
          child: _PinkBox(),
        ),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient:
                LinearGradient(colors: [Color(0xff146356), Color(0xffA3DA8D)])),
      ),
    );
  }
}
