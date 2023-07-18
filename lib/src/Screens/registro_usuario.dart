import 'dart:io';

import 'package:ecompost/src/Screens/inicio_sesion.dart';
import 'package:ecompost/src/Screens/screens.dart';
import 'package:ecompost/src/Widgets/container_circula.dart';
import 'package:ecompost/src/utils/notificactions.dart';
import 'package:ecompost/src/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../Provider/providers.dart';
import 'package:http/http.dart' as http;

class RegistroUsuario extends StatelessWidget {
  static const String name = "RegistroUsuario";

  const RegistroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final checkValor = Provider.of<AccionesIcons>(context);
    final registerForm = Provider.of<RegisterForm>(context);
    TextStyle estiloText = const TextStyle(
        decoration: TextDecoration.underline, color: Color(0xff0043EE));

    final List<String> campos = [
      "Nombre",
      "Correo",
      "Contraseña",
      "Confirmar Contraseña"
    ];
    final verImage = Provider.of<ImagePickerFoto>(context);
    final tituloEstilo = Theme.of(context).textTheme.headline1;

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
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Text('EcomPost', style: tituloEstilo),
            SizedBox(
              height: size.width * 0.1,
            ),
            //logo
            ContainerCircular(verImage: verImage),
            //Campo ususario

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: Form(
                key: registerForm.formKey,
                child: Column(
                  children: [
                    for (int i = 0; i < campos.length; i++)
                      Column(
                        children: [
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: campos[i] == "Contraseña" ||
                                    campos[i] == "Confirmar Contraseña"
                                ? true
                                : false,
                            decoration: InputDecoration(
                              prefixIcon: i <= 1
                                  ? const Icon(
                                      Icons.person,
                                    )
                                  : const Icon(
                                      Icons.lock_rounded,
                                    ),
                              hintText: campos[i],
                            ),
                            validator: (value) {
                              return i != 3
                                  ? Validations.getValitadionsRegister(i, value)
                                  : Validations.getValitadionsRegister(i, value,
                                      password: registerForm.password,
                                      passwordConfirm:
                                          registerForm.confirmPassword);
                            },
                            onChanged: (value) {
                              switch (i) {
                                case 0:
                                  registerForm.nombre = value;
                                  break;
                                case 1:
                                  registerForm.email = value;

                                  break;
                                case 2:
                                  registerForm.password = value;

                                  break;
                                case 3:
                                  registerForm.confirmPassword = value;

                                  break;
                              }
                            },
                          ),
                          SizedBox(
                            height: i == 3 ? 0 : 20,
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        Checkbox(
                            value: checkValor.checkValor,
                            onChanged: (valor) => (checkValor.checkValor)
                                ? checkValor.isCheckValor = false
                                : checkValor.isCheckValor = true),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Al registarte aceptas nuestros"),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, 'TerminosyPrivacidad'),
                              child: Row(
                                children: [
                                  Text(
                                    "Términos",
                                    style: estiloText,
                                  ),
                                  const Text(" y "),
                                  Text("Avisos de privacidad ",
                                      style: estiloText),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            //boton iniciar sesion
            ElevatedButton(
                child: const Text("Registrar"),
                onPressed: () async {
                  if (registerForm.isValiForm() && checkValor.checkValor) {
                    Navigator.pushReplacementNamed(context, InicioSesion.name);
                    await postData(registerForm.nombre, registerForm.email,
                        registerForm.password, verImage.image);
                    Fluttertoast.showToast(
                        msg: 'Registro de Usuario exitoso',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM);

                    registerForm.isCheckt = checkValor.checkValor;
                    checkValor.isCheckValor = false;
                  } else if (!checkValor.checkValor) {
                    Notifications.showSnackbar(
                        "Acepta terminos y avisos de privacidad ");
                  }
                }),
          ],
        ),
      ),
    );
  }
}

//Metodo para hacer post
Future postData(String name, String correo, String password, File? img) async {
  final url = Uri.parse("http://216.238.78.124:3000/api/usuario");

  final imageUploadRequest = http.MultipartRequest('POST', url);
  if (img != null) {
    final file = await http.MultipartFile.fromPath('imagen', img.path);
    imageUploadRequest.files.add(file);
  }

  final nombre = http.MultipartFile.fromString('nombre', name);
  imageUploadRequest.files.add(nombre);

  final gmail = http.MultipartFile.fromString('Correo', correo);
  imageUploadRequest.files.add(gmail);

  final pass = http.MultipartFile.fromString('password', password);
  imageUploadRequest.files.add(pass);

  final streamReponse = await imageUploadRequest.send();
  final resp = await http.Response.fromStream(streamReponse);

  if (resp.statusCode != 200 && resp.statusCode != 201) {
    print('Algo salio mal');
    return null;
  }
}
