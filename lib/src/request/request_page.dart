import 'dart:async';

import 'package:ecompost/src/request/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Screens/screens.dart';

class RequestPage extends StatefulWidget {
  static const String name = "requespage";

  const RequestPage({super.key});
  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> with WidgetsBindingObserver {
  final controller = RequestController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  bool _fromSettings = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = controller.statusChange.listen((status) {
      switch (status) {
        case PermissionStatus.granted:
          _goToHome();
          break;
        case PermissionStatus.permanentlyDenied:
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Alerta'),
              content:
                  const Text('No se pudo recuperar el acceso a la ubicación'),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      _fromSettings = await openAppSettings();
                    },
                    child: const Text('Ir a configuración')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'))
              ],
            ),
          );

          break;
        default:
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _fromSettings) {
      final status = await controller.check();
      if (status == PermissionStatus.granted) {
        _goToHome();
      }
    }
    _fromSettings = false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    controller.dispose();
    super.dispose();
  }

  void _goToHome() {
    Navigator.pushReplacementNamed(context, Home.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: const Text('Alerta'),
        content: const Text('Por favor habilita los permisos de ubicación'),
        actions: [
          TextButton(
              onPressed: () {
                controller.request();
              },
              child: const Text('Habilitar')),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, InicioSesion.name);
              },
              child: const Text('Cancelar'))
        ],
      ),
    );
  }
}
