import 'dart:convert';
import 'package:flutter_state/models/pokeDescModel.dart';
import 'package:flutter_state/models/pokeModel.dart';
import 'package:http/http.dart' as http;

Future<PokemonModel> fetchData({String nextUrl}) async {
  try {
    String searchQueryUrl;
    if (nextUrl != null) {
      searchQueryUrl = 'https://pokeapi.co/api/v2/pokemon/$nextUrl';
    } else {
      searchQueryUrl = 'https://pokeapi.co/api/v2/pokemon/';
    }
    final response = await http.get(searchQueryUrl);
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  } catch (e) {
    return e;
  }
}

Future<PokeDesc> fetchDetails(int dex) async {
  final String searchQueryUrl = 'https://pokeapi.co/api/v2/pokemon/$dex';
  final response = await http.get(searchQueryUrl);
  if (response.statusCode == 200) {
    return PokeDesc.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}
