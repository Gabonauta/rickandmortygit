import 'package:flutter/material.dart';

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
  Widget buildResults(BuildContext context) => Center(
        child: Text(query),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> charactersSuggestions = searchResults.where((element) {
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
    );
  }
}
