import 'package:ecompost/src/Provider/horario_data.dart';
import 'package:ecompost/src/Provider/homecontroller.dart';
import 'package:ecompost/src/Provider/image_picker.dart';
import 'package:ecompost/src/Provider/register_ecopunto.dart';
import 'package:ecompost/src/Screens/home.dart';
import 'package:ecompost/src/Widgets/container_circula.dart';
import 'package:ecompost/src/Widgets/horario.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../Provider/idCreador.dart';
import '../Provider/login_form.dart';
import '../Provider/usuarios.dart';

class RegistroEcopunto extends StatelessWidget {
  static const String name = "RegistroEcopunto";

  Location location = Location();

  bool _serviceEnabled = false;

  PermissionStatus _permissionGranted = PermissionStatus.granted;

  LocationData _locationData = LocationData.fromMap({});
  late String longitud = "";
  late String latitud = "";

  @override
  Widget build(BuildContext context) {
    final verImage = Provider.of<ImagePickerFoto>(context);
    final registerEcopunto = Provider.of<RegisterEcopunto>(context);
    final horarioData = Provider.of<HorarioData>(context);
    final idCreadorP = Provider.of<idCreador>(context);
    final size = MediaQuery.of(context).size;
    final loginForm = Provider.of<LoginForm>(context);
    final marcador = Provider.of<HomeController>(context);

    final List<String> campos = [
      "Nombre de la empresa",
      "Telefono",
      "Tipo de desecho",
    ];

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
                    if (registerEcopunto.getNombreEmpresa == "" ||
                        registerEcopunto.getTelefono == "" ||
                        registerEcopunto.getDesecho == "" ||
                        horarioData.getDiaInicio == "" ||
                        horarioData.getDiaFinal == "" ||
                        horarioData.getHoraInicio == "" ||
                        horarioData.getHoraFinal == "") {
                      Fluttertoast.showToast(
                          msg: "Debes rellenar todos los campos",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM);
                    } else {
                      if (longitud == "" && latitud == "") {
                        Fluttertoast.showToast(
                            msg: "Primero debe seleccionar una ubicacion",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM);
                      } else {
                        final res = await postData2(
                            idCreadorP.getIdCreador,
                            registerEcopunto.getNombreEmpresa,
                            registerEcopunto.getTelefono,
                            registerEcopunto.getDesecho,
                            longitud,
                            latitud,
                            horarioData.getDiaInicio,
                            horarioData.getDiaFinal,
                            horarioData.getHoraInicio,
                            horarioData.getHoraFinal);
                        Fluttertoast.showToast(
                            msg: 'Registro de Ecopunto exitoso',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM);
                        Navigator.pushNamed(context, Home.name);
                      }
                    }
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
                            keyboardType: i == 1
                                ? TextInputType.phone
                                : TextInputType.name,
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
                            onChanged: (value) {
                              switch (i) {
                                case 0:
                                  registerEcopunto.setNombreEmpresa = value;
                                  break;
                                case 1:
                                  registerEcopunto.setTelefono = value;

                                  break;
                                case 2:
                                  registerEcopunto.setDesecho = value;

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
                    builder: (context) => const Horario());
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
                longitud = '${data!.latitude}';
                latitud = '${data.longitude}';
                double lat = data.latitude!.toDouble();
                double long = data.longitude!.toDouble();
                LatLng resul2 = LatLng(lat, long);
                marcador.onTapMarker2(context, resul2);
                print(resul2);
                Fluttertoast.showToast(
                    msg: 'Latitud ${data.latitude}\nLongitud ${data.longitude}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM);
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

//Metodo para hacer post
Future postData2(
    String idCreador,
    nombre,
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
