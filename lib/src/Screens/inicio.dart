import 'package:ecompost/src/Provider/image_picker.dart';
import 'package:ecompost/src/Screens/inicio_sesion.dart';
import 'package:ecompost/src/Screens/registro_usuario.dart';
import 'package:ecompost/src/Services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../Services/mapbox.dart';
import 'home.dart';

class Inicio extends StatelessWidget {
  static const String name = "Inicio";
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    final a = Provider.of<MapBox>(context);
    final size = MediaQuery.of(context).size;
    final tituloEstilo = Theme.of(context).textTheme.headline1;
    const colorIconPrincipal = Color.fromARGB(255, 195, 212, 40);
    const colorIconSecundario = Color.fromARGB(255, 235, 29, 53);
    final verImage = Provider.of<ImagePickerFoto>(context);
    Firebase.initializeApp();
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('EcomPost', style: tituloEstilo),
              //LOGO
              Image(
                image: const AssetImage('assets/img/logo.png'),
                fit: BoxFit.contain,
                width: size.width * 0.7,
                height: 139,
              ),
              //BOTON REGISTRAR CON GOOGLE
              ElevatedButton.icon(
                  label: const Text('Registrar con Google'),
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: colorIconSecundario,
                  ),
                  onPressed: () async {
                    User? user =
                        await Authentication.iniciarSesion(context: context);

                    if (user != null) {
                      if (user.photoURL != null) {
                        verImage.setUrl = user.photoURL!;
                      }
                      verImage.setName = user.displayName!;

                      Navigator.pushNamed(context, Home.name);
                      postData(user.displayName, user.email, user.uid);
                      Fluttertoast.showToast(
                          msg: 'Inicio de sesion por google exitosa',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM);
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Error de usuario',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM);
                    }
                  }),
              //BOTON REGISTRAR CON CORREO
              ElevatedButton.icon(
                label: const Text('Registrar con correo'),
                icon: const Icon(
                  Icons.email,
                  color: colorIconPrincipal,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegistroUsuario.name);
                  verImage.elimnar();
                },
              ),
              Text('o', style: tituloEstilo),
              //BOTON INICIAR SESION
              ElevatedButton.icon(
                label: const Text('Iniciar sesión'),
                icon: const Icon(
                  Icons.person,
                  color: colorIconPrincipal,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, InicioSesion.name),
              ),

              TextButton(
                  onPressed: () {},
                  child: const Text("¿Olvidaste tu contraseña?")),
            ]),
      ),
    );
  }
}

//Metodo para hacer post
Future postData(String? nombre, String? correo, String? password) async {
  var response = await http.post(
      //Para que el post funcione cambiar ip y accessToken a los propios
      Uri.parse("http://216.238.78.124:3000/api/usuario"),
      body: {
        "nombre": nombre,
        "Correo": correo,
        "password": password,
      });
  print(response.body);
}
