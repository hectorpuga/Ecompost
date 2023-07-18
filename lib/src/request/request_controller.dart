import 'dart:async';

import 'package:permission_handler/permission_handler.dart';

class RequestController {
  final Permission _locacion;

  RequestController(this._locacion);

  final _streamController = StreamController<PermissionStatus>.broadcast();

  Stream<PermissionStatus> get statusChange => _streamController.stream;

  Future<PermissionStatus> check() async {
    final status = await _locacion.status;
    return status;
  }

  Future<void> request() async {
    final status = await _locacion.request();
    _nofify(status);
  }

  void _nofify(PermissionStatus status) {
    if (!_streamController.isClosed && _streamController.hasListener) {
      _streamController.sink.add(status);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
