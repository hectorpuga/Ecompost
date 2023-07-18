import 'dart:async';

import 'package:ecompost/src/Provider/ecopuntos.dart';
import 'package:ecompost/src/Screens/inicio_sesion.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../Helpers/imagemarcador.dart';
import '../Screens/mostrar_empresa.dart';

class HomeController extends ChangeNotifier {
  CameraPosition puntoInicial = const CameraPosition(
    target: LatLng(22.740392369849218, -98.97298698619345),
    zoom: 14.4746,
  );
  void onMapCreated(GoogleMapController controller) {}
  bool _loading = true;
  bool get loading => _loading;
  static const String name = "Home";
  bool _gps = false;
  bool get gps => _gps;
  int contador = 0;
  StreamSubscription? _gpsSuscription;

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  void onTapMarker2(BuildContext context, LatLng l) async {
    final markerId = MarkerId(markers.length.toString());
    final icon = await markerIcon.future;
    final marker = Marker(
      markerId: markerId,
      position: l,
      icon: icon,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>  MostrarEmpresaScreen(),
          ),
        );
      },
    );
    _markers[markerId] = marker;

    notifyListeners();
  }

  void onTapMarker(BuildContext context) async {
    List u = await Ecopuntos.getData();
    for (int i = 0; i < u.length; i++) {
      if (InicioSesion.idPro == u[i]["idCreador"]) {
        String lat = u[i]["Longitud"];
        double lat2 = double.parse(lat);
        String long = u[i]["Latitud"];
        double long2 = double.parse(long);
        LatLng resul2 = LatLng(lat2, long2);
        final markerId = MarkerId(i.toString());
        final icon = await markerIcon.future;
        final marker = Marker(
          markerId: markerId,
          position: resul2,
          icon: icon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  MostrarEmpresaScreen(),
              ),
            );
          },
        );
        _markers[markerId] = marker;
      }
    }
    notifyListeners();
  }

  Completer markerIcon = Completer<BitmapDescriptor>();
  HomeController() {
    _init();
    assetToBytes('assets/img/logo.png').then((value) {
      final bitmap = BitmapDescriptor.fromBytes(value);
      markerIcon.complete(bitmap);
    });
  }
  Future<void> _init() async {
    _gps = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    _gpsSuscription = Geolocator.getServiceStatusStream().listen((status) {
      _gps = status == ServiceStatus.enabled;
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> encerdergps() async => Geolocator.openLocationSettings();

  @override
  void dispose() {
    _gpsSuscription?.cancel();
    super.dispose();
  }
}

class ClassContext extends StatelessWidget {
  const ClassContext({super.key});

  @override
  Widget build(BuildContext context) {
    final marcador = Provider.of<HomeController>(context);
    return Container();
  }
}
