import 'dart:convert';

import 'package:ecompost/src/Provider/prefilDataEco.dart';
import 'package:ecompost/src/Widgets/horarioM.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import '../Provider/horario_data.dart';
import '../Provider/idCreador.dart';
import '../Provider/providers.dart';
import '../Widgets/container_circula.dart';
import '../Widgets/horario.dart';
import 'package:http/http.dart' as http;

class ModificarEcopunto extends StatelessWidget {
  static const String name = "ModificarEcopunto";

  Location location = Location();

  bool _serviceEnabled = false;

  PermissionStatus _permissionGranted = PermissionStatus.granted;

  LocationData _locationData = LocationData.fromMap({});
  late String longitud = "";
  late String latitud = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> campos = [
      "Nombre de la empresa",
      "Telefono",
      "Tipo de desecho"
    ];
    final verImage = Provider.of<ImagePickerFoto>(context);
    final prefillDataEcoP = Provider.of<prefillDataEco>(context);
    final registerEcopunto = Provider.of<RegisterEcopunto>(context);
    final horarioData = Provider.of<HorarioData>(context);
    final idCreadorP = Provider.of<idCreador>(context);
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
                  onPressed: () async {
                    await postDataM(
                        idCreadorP.getIdCreador,
                        registerEcopunto.getNombreEmpresa,
                        registerEcopunto.getTelefono,
                        registerEcopunto.getDesecho,
                        prefillDataEcoP.getLongitud,
                        prefillDataEcoP.getLatitud,
                        prefillDataEcoP.getDiaEntrada,
                        prefillDataEcoP.getDiaSalida,
                        prefillDataEcoP.getHoraEntrada,
                        prefillDataEcoP.getHoraSalida);
                    delData(prefillDataEcoP.getIdEcopunto);
                    Fluttertoast.showToast(
                        msg: 'Actualizacion de Ecopunto exitosa',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM);
                    Navigator.pop(context);
                    
                  },
                ),
              ],
            ),

            //logo
            ContainerCircular(verImage: verImage),
            //Campo ususario

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
              child: Form(
                child: Column(
                  children: [
                    for (int i = 0; i < campos.length; i++)
                      Column(
                        children: [
                          TextFormField(
                            initialValue: i == 0
                                ? prefillDataEcoP.getNombreEmpresa
                                : i == 1
                                    ? prefillDataEcoP.getTelefono
                                    : i == 2
                                        ? prefillDataEcoP.getTipoDesecho
                                        : "xd",
                            decoration: InputDecoration(
                              prefixIcon: Icon(i == 0
                                  ? Icons.store
                                  : i == 1
                                      ? Icons.phone
                                      : i == 2
                                          ? Icons.eco
                                          : Icons.calendar_month),
                              hintText: campos[i],
                            ),
                            onChanged: (value) async {
                              switch (i) {
                                case 0:
                                  registerEcopunto.setNombreEmpresa = value;
                                  List a = await getDataEco2();
                                  for(int i =0; i<a.length; i++){
                                  if(idCreadorP.id_Creador==a[i]["idCreador"] && prefillDataEcoP.getIdEcopunto == a[i]["_id"]){
                                    registerEcopunto.setTelefono = a[i]["Telefono"];
                                    registerEcopunto.setDesecho = a[i]["TipoDesecho"];
                                  }
                                  }
                                  break;
                                case 1:
                                  registerEcopunto.setTelefono = value;
                                  List a = await getDataEco2();
                                  for(int i =0; i<a.length; i++){
                                  if(idCreadorP.id_Creador==a[i]["idCreador"] && prefillDataEcoP.getIdEcopunto == a[i]["_id"]){
                                    registerEcopunto.setNombreEmpresa = a[i]["nombreE"];
                                    registerEcopunto.setDesecho = a[i]["TipoDesecho"];
                                  }
                                  }
                                  break;
                                case 2:
                                  registerEcopunto.setDesecho = value;
                                   List a = await getDataEco2();
                                  for(int i =0; i<a.length; i++){
                                  if(idCreadorP.id_Creador==a[i]["idCreador"] && prefillDataEcoP.getIdEcopunto == a[i]["_id"]){
                                    registerEcopunto.setNombreEmpresa = a[i]["nombreE"];
                                    registerEcopunto.setTelefono = a[i]["Telefono"];
                                  }
                                  }
                                  break;
                                case 3:
                                  registerEcopunto.Horario = value;

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
            ElevatedButton.icon(
              label: const Text('Horario'),
              icon: const Icon(
                Icons.calendar_month_outlined,
              ),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const HorarioM());
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              label: const Text('Seleccione Ubicacion'),
              icon: const Icon(
                Icons.location_pin,
              ),
              onPressed: () async {
                LocationData? data = await getLocation();
                longitud = '${data?.longitude}';
                latitud = '${data?.latitude}';
                if(prefillDataEcoP.getLongitud == longitud && 
                  prefillDataEcoP.getLatitud == latitud){
                    Fluttertoast.showToast(
                    msg: 'La ubicacion es la misma',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
                    print("son las mismas");
                }else{
                  prefillDataEcoP.setLongitud = longitud;
                  prefillDataEcoP.setLatitud =latitud;
                  Fluttertoast.showToast(
                    msg: 'Latitud ${data?.latitude}\nLongitud ${data?.longitude}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
                    print("no son las mismas");
                }
                
                
                
              },
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xffEB1D35)),
              label: const Text('Eliminar Ecopunto    '),
              icon: const Icon(
                Icons.delete_outline,
              ),
              onPressed: () {
                delData(prefillDataEcoP.getIdEcopunto);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<LocationData?> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}

Future delData(String idEcopunto) async {
  var response = await http
      .delete(Uri.parse("http://216.238.78.124:3000/api/eco/$idEcopunto"));
}

Future postDataM(
    String idCreador,
    String nombre,
    String telefono,
    String desecho,
    String longitud,
    String latitud,
    String diaEntrada,
    String diaSalida,
    String horaEntrada,
    String horaSalida) async {
  var response =
      await http.post(Uri.parse("http://216.238.78.124:3000/api/eco"), body: {
    "idCreador": idCreador,
    "nombreE": nombre,
    "Telefono": telefono,
    "TipoDesecho": desecho,
    "Longitud": longitud,
    "Latitud": latitud,
    "DiaEntrada": diaEntrada,
    "DiaSalida": diaSalida,
    "HoraEntrada": horaEntrada,
    "HoraSalida": horaSalida,
  });
}

Future<List> getDataEco2() async {
  var response =
      await http.get(Uri.parse("http://216.238.78.124:3000/api/eco"));

  final List ecopuntos = json.decode(response.body);

  return ecopuntos;
}
