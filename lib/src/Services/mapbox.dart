import 'dart:async';

import 'package:ecompost/src/Helpers/debouncer.dart';
import 'package:ecompost/src/Models/ciudad.dart';
import 'package:ecompost/src/Models/search_ciudades.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapBox extends ChangeNotifier {
  final String _baseUrl = 'api.mapbox.com';
  final String _accesstoken =
      'pk.eyJ1IjoiaGVjdG9yMTIzNCIsImEiOiJjbDAzbDJubHQxNXRiM2tucGp1dHJ6cHk5In0.zbuHbcnT59RemDu4ZY6Z-A';
  List<Ciudad> ciudades = [];

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );

  final StreamController<List<Ciudad>> _suggestionsStreamController =
      new StreamController.broadcast();

  Stream<List<Ciudad>> get suggestionStream =>
      this._suggestionsStreamController.stream;

  Future<List<Ciudad>> searchCiudad(String query) async {
    final url = Uri.https(
        _baseUrl,
        "/geocoding/v5/mapbox.places/search_text=$query.json",
        {"access_token": _accesstoken, "limit": "9"});
    final response = await http.get(url);
    final ciudad = Ciudades.fromJson(response.body);
    return ciudad.result;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await this.searchCiudad(value);
      ciudades = results;
      this._suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((value) => timer.cancel());
  }
}
