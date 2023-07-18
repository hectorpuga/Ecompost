import 'package:ecompost/src/Provider/acciones_icons.dart';
import 'package:ecompost/src/Screens/inicio_sesion.dart';
import 'package:ecompost/src/Widgets/card_rounder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/ecopuntos.dart';
import '../Provider/usuarios.dart';

class MostrarEmpresaScreen extends StatelessWidget {
  static const String name = "MostrarEmpresa";
  static String puntonombre2= "";
  static String usuario2= "";
    MostrarEmpresaScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final puntuacion = Provider.of<AccionesIcons>(context);
    
    final List textos = [
      "Informacion",
      "PET",
      "El Mante, Tamaulipas",
      "831-153-23-33",
      "Lunes - Sabado"
    ];
    final List<String> datos = [
    ];
    return Scaffold(
      body: GestureDetector(
        onTap: () async{
          List u = await Ecopuntos.getData();
          List u2 = await UsuarioProvider.getData();
            for (int i = 0; i < u.length; i++) {
              if (InicioSesion.idPro==u[i]["idCreador"]) {
                  String puntonombre = u[i]["nombreE"];
                  puntonombre2 = puntonombre;
              }
            }
            for (int i = 0; i < u2.length; i++) {
              if (InicioSesion.idPro==u2[i]["_id"]) {
                  String usuario = u2[i]["nombre"];
                  usuario2 = usuario;
              }
            }
        },
        
        child: Container(
          color: Colors.white.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CardRounder(
                  componentes: Image(
                      image: AssetImage("assets/img/empresa.jpg"),
                      fit: BoxFit.cover),
                  sizeWidth: 320,
                  sizeHeight: 180),
              const SizedBox(
                height: 20,
              ),
              Row (
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                     Text(
                      puntonombre2,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]
                  ),
              Text(usuario2),
              const SizedBox(
                height: 12,
              ),
              for (int i = 0; i < textos.length; i++)
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      if (i != 0)
                        Icon(i == 1
                            ? Icons.recycling
                            : i == 2
                                ? Icons.location_on
                                : i == 3
                                    ? Icons.phone
                                    : Icons.calendar_month),
                         
                      Text(textos[i])
                    ],
                  ),
                ),
              const SizedBox(
                height: 55,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  
}
