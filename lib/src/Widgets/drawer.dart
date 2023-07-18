import 'dart:convert';

import 'package:ecompost/src/Provider/datosEco.dart';
import 'package:ecompost/src/Provider/image_picker.dart';
import 'package:ecompost/src/Provider/prefilDataEco.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../Provider/idCreador.dart';
import '../utils/iconos_util.dart';
import '../utils/opciones_drawer.dart';
import 'package:ecompost/src/Screens/modificar_ecopunto.dart';
import 'package:ecompost/src/Widgets/drawer_heder.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 50),
        color: const Color(0xffE9EBBF),
        child: _listaOpciones());
  }
}

Widget _listaOpciones() {
  return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listaItems(snapshot.data, context));
      });
}

List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
  final verImage = Provider.of<ImagePickerFoto>(context);
  final datosEcoP = Provider.of<datosEco>(context);
  final idCreadorP = Provider.of<idCreador>(context);
  final prefillDataEcoP = Provider.of<prefillDataEco>(context);
  final List<Widget> opciones = [];
  int numComposta;
  String nomComposta;

  opciones.add(DrawerHederWidget(
    nombre: verImage.getNombre,
    url: verImage.getUrl,
  ));

  Widget? widgetTemp;
  for (var opt in data!) {
    opt['texto'] != "Favoritos" && opt["texto"] != "Tus Ecopuntos"
        ? widgetTemp = ListTile(
            title: Text(
              opt['texto'],
              style: const TextStyle(color: Colors.black),
            ),
            leading: opt['icon'] != "null" ? getIcon(opt['icon']) : null,
            onTap: () {
              Navigator.pushNamed(context, opt['ruta']);
              verImage.elimnar();
            })
        : widgetTemp = ExpansionTile(
            backgroundColor: Colors.white24,
            title: Text(opt['texto']),
            leading: getIcon(opt['icon']),
            trailing: const Icon(null),
            children: [
                for (int i = 0; i < datosEcoP.getNumEco; i++)
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Divider(),
                        Text(
                          //aqui cambiar por los ecopuntos en sí
                          datosEcoP.nomEco[i],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    onTap: () async {
                      List filEco = await getDataEco2();
                      for (int j = 0; j < filEco.length; j++) {
                        if (idCreadorP.getIdCreador == filEco[j]["idCreador"] &&
                            datosEcoP.getNomEco[i] == filEco[j]["nombreE"] &&
                            datosEcoP.id[i] == filEco[j]["_id"]) {
                          prefillDataEcoP.setIdEcopunto = filEco[j]["_id"];
                          prefillDataEcoP.setNombreEmpresa =
                              filEco[j]["nombreE"];
                          prefillDataEcoP.setTelefono = filEco[j]["Telefono"];
                          prefillDataEcoP.setTipoDesecho =
                              filEco[j]["TipoDesecho"];
                          prefillDataEcoP.setLongitud = filEco[j]["Longitud"];
                          prefillDataEcoP.setLatitud = filEco[j]["Latitud"];
                          prefillDataEcoP.setDiaEntrada =
                              filEco[j]["DiaEntrada"];
                          prefillDataEcoP.setDiaSalida = filEco[j]["DiaSalida"];
                          prefillDataEcoP.setHoraEntrada =
                              filEco[j]["HoraEntrada"];
                          prefillDataEcoP.setHoraSalida =
                              filEco[j]["HoraSalida"];
                        }
                      }
                      String a = prefillDataEcoP.getNombreEmpresa;
                      print(a);
                      Navigator.pushNamed(context, ModificarEcopunto.name);
                      verImage.elimnar();
                    },
                  ),
                const Divider(),
              ]);

    opciones.add(widgetTemp);
  }
  return opciones;
}

Future<List> getDataEco2() async {
  var response =
      await http.get(Uri.parse("http://216.238.78.124:3000/api/eco"));

  final List ecopuntos = json.decode(response.body);

  return ecopuntos;
}
