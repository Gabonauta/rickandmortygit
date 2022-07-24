import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Color(0xff146356);
    return Table(
      children: [
        TableRow(children: [
          _SigleCard(
            color: color,
            image: Image.asset("assets/images/not_found.jpg"),
            text: 'Unknown Rick',
            description: "Dead",
            species: "Human",
          ),
          //species: "Human"
          _SigleCard(
            color: color,
            image: Image.asset("assets/images/not_found.jpg"),
            text: 'Unknown Rick',
            description: "Dead",
            species: "Humanoid",
          ),
        ]),
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {
  final Image image;
  final Color color;
  final String text;
  final String description;
  final String species;

  const _SigleCard(
      {Key? key,
      required this.image,
      required this.color,
      required this.text,
      required this.description,
      required this.species})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BackgroundCard(
        widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.33,
          height: 100,
          decoration: BoxDecoration(color: Color(0xff146356)),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          this.text,
          style: TextStyle(color: this.color, fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.description,
              style: TextStyle(color: this.color, fontSize: 18),
            ),
            const SizedBox(width: 5),
            Text(
              "-",
              style: TextStyle(color: this.color, fontSize: 18),
            ),
            const SizedBox(width: 5),
            Text(
              this.species,
              style: TextStyle(color: this.color, fontSize: 18),
            ),
          ],
        )
      ],
    ));
  }
}

class _BackgroundCard extends StatelessWidget {
  final Widget widget;

  const _BackgroundCard({Key? key, required this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: Color(0xffFFF1BD),
                borderRadius: BorderRadius.circular(20)),
            child: this.widget,
          ),
        ),
      ),
    );
  }
}
