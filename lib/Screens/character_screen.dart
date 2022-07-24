import 'package:flutter/material.dart';
import 'package:rickandmortyapp/Models/character_model.dart';
import 'package:rickandmortyapp/Widgets/widgets.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  @override
  Widget build(BuildContext context) {
    final Character character =
        ModalRoute.of(context)!.settings.arguments as Character;
    var color = Colors.green;
    if (character.status == "Dead") {
      color = Colors.red;
    } else if (character.status == "Alive") {
      color = Colors.green;
    } else {
      color = Colors.grey;
    }

    const titles = TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff146356),
          title: Text(
            character.name,
            // style: TextStyle(color: Color(0xffFFF1BD)),
          ),
        ),
        body: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: Column(
                children: [
                  //imagen
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: NetworkImage(character.image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  //status
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
                        character.status,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffFFF1BD),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Character Details",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Gender",
                          style: titles,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          character.gender,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Species",
                          style: titles,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          character.species,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Last known location",
                          style: titles,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          character.location.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Origin",
                          style: titles,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          character.origin.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
