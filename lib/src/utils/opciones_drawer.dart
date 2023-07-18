import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _OpcionesDrawer {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _OpcionesDrawer();
