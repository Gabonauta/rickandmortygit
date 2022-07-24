import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/Models/character_model.dart';

import '../Services/characters_service.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchResults = ['Rick', 'Morty', 'Jerry', 'Summer'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {}
          query = '';
        },
        icon: const Icon(Icons.clear));
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () => close(context, null), icon: const Icon(Icons.clear));
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text("resultado"));
  }

  Widget _empty() {
    return const Center(
      child: Icon(
        Icons.person_search,
        color: Colors.black38,
        size: 130,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /* List<String> charactersSuggestions = searchResults.where((element) {
      final result = element;
      final input = query;
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final character = charactersSuggestions[index];
        return ListTile(
          title: Text(character),
          onTap: () {
            query = character;
            showResults(context);
          },
        );
      },
      itemCount: charactersSuggestions.length,
    );*/
    if (query.isEmpty) {
      return _empty();
    }
    final charactersService =
        Provider.of<CharactersService>(context, listen: false);

    return FutureBuilder(
      future: charactersService.getCharacterByName(query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return _empty();
        List<Character> characters = snapshot.data as List<Character>;
        return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) => _CharacterItem(
            character: characters[index],
          ),
        );
      },
    );
  }
}

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage("assets/images/not_found.jpg"),
        image: NetworkImage(character.image),
        width: 80,
        fit: BoxFit.contain,
      ),
      title: Text(character.name),
      onTap: (() {
        Navigator.pushNamed(context, "character", arguments: character);
      }),
    );
  }
}
