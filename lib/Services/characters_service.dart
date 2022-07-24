import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/Models/character_model.dart';

class CharactersService extends ChangeNotifier {
  final String _baseUrl = "rickandmortyapi.com";
  final List<Map<String, dynamic>> allcharacters = [];
  List<Character> charactersMap = [];
  int _page = 0;
  bool isLoading = true;
  //fetch characters
  CharactersService() {
    loadCharacters();
  }
  Future<List<Character>> loadCharacters() async {
    _page++;
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "/api/character/", {'page': "$_page"});
    final resp = await http.get(url);
    final Map<String, dynamic> alldata = json.decode(resp.body);
    allcharacters.addAll(
      List<Map<String, dynamic>>.from(
        alldata["results"],
      ),
    );

    for (var element in allcharacters) {
      final tempChar = Character.fromMap(element);
      charactersMap.add(tempChar);
    }
    //charactersMap = [...charactersMap]
    isLoading = false;
    notifyListeners();
    return charactersMap;
    //charactersMap.addAll(Character.fromMap(allcharacters));
  }
}
