import 'package:ecompost/src/Provider/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Mapa extends StatelessWidget {
  static const String name = "Mapa";

  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    final marcador = Provider.of<HomeController>(context);
        if (!marcador.gps) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    'Presiona el boton y habilita la opción habilitar gps para usar el mapa',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    maxLines: 3),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      final controller = context.read<HomeController>();
                      controller.encerdergps();
                    },
                    child: const Text('Habilitar Gps'))
              ],
            ),
          );
        }
        return GoogleMap(
          zoomControlsEnabled: false,
          markers: marcador.markers,
          myLocationButtonEnabled: true,
          compassEnabled: false,
          myLocationEnabled: true,
          initialCameraPosition: marcador.puntoInicial,
          onMapCreated: marcador.onMapCreated,
        );
  }
}
