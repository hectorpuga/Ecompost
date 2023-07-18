import 'package:ecompost/src/Provider/image_picker.dart';
import 'dart:convert';

import 'package:ecompost/src/Provider/datosEco.dart';
import 'package:ecompost/src/Provider/idCreador.dart';
import 'package:ecompost/src/Provider/login_form.dart';
import 'package:ecompost/src/Provider/usuarios.dart';
import 'package:ecompost/src/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../Provider/ecopuntos.dart';
import '../Provider/homecontroller.dart';
import '../splash/splash_page.dart';
import 'package:http/http.dart' as http;

class InicioSesion extends StatelessWidget {
  static const String name = "InicioSesion";
  static String idPro = "";

  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tituloEstilo = Theme.of(context).textTheme.headline1;
    final loginForm = Provider.of<LoginForm>(context);
    final img = Provider.of<ImagePickerFoto>(context);

    final idCreadorP = Provider.of<idCreador>(context);
    final datosEcoP = Provider.of<datosEco>(context);
    final marcador = Provider.of<HomeController>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                //Boton regresar pantalla
                IconButton(
                  iconSize: size.width * 0.1,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 10.0),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Text('EcomPost', style: tituloEstilo),
            const SizedBox(
              height: 50,
            ),
            //logo
            Image(
              image: const AssetImage('assets/img/logo.png'),
              fit: BoxFit.contain,
              width: size.width * 0.7,
              height: 139,
            ),
            //Campo ususario

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1, vertical: size.height * 0.09),
              child: Form(
                key: loginForm.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        hintText: 'Correo',
                      ),
                      validator: (value) {
                        return Validations.getValitadionsInicioSesion(1, value);
                      },
                      onChanged: (value) => loginForm.email = value,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                        ),
                        hintText: 'Contraseña',
                      ),
                      validator: (value) {
                        return Validations.getValitadionsInicioSesion(2, value);
                      },
                      onChanged: (value) => loginForm.password = value,
                    ),
                  ],
                ),
              ),
            ),

            //boton iniciar sesion
            ElevatedButton(
                child: const Text("Iniciar"),
                onPressed: () async {
                  if (loginForm.isValiForm()) {
                    List u = await UsuarioProvider.getData();
                    for (int i = 0; i < u.length; i++) {
                      if (loginForm.email == u[i]["Correo"] &&
                          loginForm.password == u[i]["password"]) {
                        idCreadorP.id_Creador = u[i]["_id"];

                        idPro = u[i]["_id"];
                        img.setUrl = u[i]["secure_url"];
                        Navigator.pushNamed(context, SplashPage.name);
                      } else {
                        print("No existe");
                      }
                    }

                    marcador.onTapMarker(context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}

Future<List> getDataEco() async {
  var response =
      await http.get(Uri.parse("http://216.238.78.124:3000/api/eco"));

  final List ecopuntos = json.decode(response.body);

  return ecopuntos;
}
