import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Services/services.dart';

class CardTable extends StatefulWidget {
  const CardTable({Key? key, required this.onNextPage}) : super(key: key);
  final Function onNextPage;

  @override
  State<CardTable> createState() => _CardTableState();
}

class _CardTableState extends State<CardTable> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 200)) {
        //Todo next page

        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final charactersService = Provider.of<CharactersService>(context);
    var color = const Color(0xff146356);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        controller: scrollController,
        itemCount: charactersService.charactersMap.length,
        itemBuilder: (context, index) {
          //Color state
          if (charactersService.charactersMap[index].status == "Dead") {
            color = Colors.red;
          } else if (charactersService.charactersMap[index].status == "Alive") {
            color = Colors.green;
          } else {
            color = Colors.grey;
          }
          //end color state
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "character");
            },
            child: _SigleCard(
                image: charactersService.charactersMap[index].image,
                color: color,
                text: charactersService.charactersMap[index].name,
                description: charactersService.charactersMap[index].status,
                species: charactersService.charactersMap[index].species),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}

class _SigleCard extends StatelessWidget {
  final String image;
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
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: color,
            ),
            const SizedBox(width: 5),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 5),
            const Text(
              "-",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 5),
            Text(
              species,
              style: const TextStyle(fontSize: 18),
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
      decoration: BoxDecoration(
          color: const Color(0xffFFF1BD),
          borderRadius: BorderRadius.circular(20)),
      child: widget,
    );
  }
}
