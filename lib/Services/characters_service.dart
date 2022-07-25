import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapp/Models/alldata_model.dart';
import 'package:rickandmortyapp/Models/character_model.dart';
import 'package:rickandmortyapp/Models/search_character_movie.dart';

class CharactersService extends ChangeNotifier {
  final String _baseUrl = "rickandmortyapi.com";
  final List<Map<String, dynamic>> allcharacters = [];
  List<Character> charactersMap = [];
  List<Character> searchResult = [];
  int page = 0;
  bool isLoading = true;
  //fetch characters
  CharactersService() {
    loadCharacters();
  }

  Future<List<Character>> loadCharacters() async {
    page++;
    isLoading = true;
    var dio = Dio();
    final url = "https://rickandmortyapi.com/api/character/?page=$page";
    final response = await dio.get(url);
    AllData alldata = AllData.fromMap(response.data);
    charactersMap = [...charactersMap, ...alldata.results];
    isLoading = false;
    notifyListeners();
    return charactersMap;
  }

  Future<List<Character>> getCharacterByName(String name) async {
    final url = Uri.https(_baseUrl, "/api/character/", {'name': name});
    final resp = await http.get(url);
    final alldata = SearchCharacter.fromJson(resp.body);
    return alldata.results;
  }
}
