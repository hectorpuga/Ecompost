import 'package:ecompost/src/Widgets/container_circula.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/providers.dart';
import '../utils/validations.dart';

class ModificarPerfil extends StatelessWidget {
  static const String name = "ModificarPerfil";

  const ModificarPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registerForm = Provider.of<RegisterForm>(context);

    final List<String> campos = [
      "Nombre",
      "Correo",
      "Contraseña",
      "Confirmar Contraseña"
    ];
    final verImage = Provider.of<ImagePickerFoto>(context);

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
                IconButton(
                  iconSize: size.width * 0.1,
                  padding: EdgeInsets.only(
                    top: 10,
                    left: size.width * 0.74,
                  ),
                  icon: const Icon(Icons.done),
                  onPressed: () {
                    if (registerForm.isValiForm()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),

            //logo
            ContainerCircular(verImage: verImage),
            //Campos usuario

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
