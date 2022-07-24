import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CharactersService extends ChangeNotifier {
  final String _baseUrl = "rickandmortyapi.com";
  final List<Characters> characters = [];
  bool isLoading = true;
  //fetch characters
  CharactersService() {
    loadCharacters();
  }
  Future loadCharacters() async {
    final url = Uri.https(_baseUrl, "/api/character");
    final resp = await http.get(url);
    final Map<String, dynamic> charactersMap = json.decode(resp.body);
    print(charactersMap);
  }
}
