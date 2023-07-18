import 'package:ecompost/src/Services/mapbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ciudad.dart';

class LugaresSearch extends SearchDelegate {
  @override
  String? get searchFieldLabel => "Buscar Lugar";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final ciudades = Provider.of<MapBox>(context, listen: false);
    return ListView(
      children: [
        for (int i = 0; i < ciudades.ciudades.length; i++)
          ListTile(
            leading: const Icon(Icons.location_pin),
            title: Text(
              ciudades.ciudades[i].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(ciudades.ciudades[i].placeName),
          ),
      ],
    );
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.eco_outlined,
        size: 130,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final ciudades = Provider.of<MapBox>(context, listen: false);
    ciudades.getSuggestionsByQuery(query);
    return StreamBuilder(
      stream: ciudades.suggestionStream,
      builder: (_, AsyncSnapshot<List<Ciudad>> snapshot) {
        if (!snapshot.hasData) {
          return _emptyContainer();
        }

        final ciudad = snapshot.data;
        return ListView.builder(
          itemCount: ciudad!.length,
          itemBuilder: (_, index) => CiudadItem(ciudad: ciudad[index]),
        );
      },
    );
  }
}

class CiudadItem extends StatelessWidget {
  final Ciudad ciudad;
  const CiudadItem({Key? key, required this.ciudad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.location_pin),
          title: Text(
            ciudad.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text(ciudad.placeName),
        ),
        Divider()
      ],
    );
  }
}
