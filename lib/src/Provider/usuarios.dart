import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuarioProvider {
//Metodo para hacer post
  static Future<List> getData() async {
    var response = await http.get(
        //Para que el post funcione cambiar ip y accessToken a los propios
        Uri.parse("http://216.238.78.124:3000/api/usuario"));

    final List usuarios = json.decode(response.body);

    return usuarios;
  }
}
