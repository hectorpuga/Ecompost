import 'package:flutter/material.dart';

class prefillDataEco extends ChangeNotifier {
  String _idEcopunto="";
  String _nombreEmpresa="";
  String _telefono="";
  String _tipoDesecho="";
  String _longitud="";
  String _latitud="";
  String _diaEntrada="";
  String _diaSalida="";
  String _horaEntrada="";
  String _horaSalida="";

  get getIdEcopunto {
    return _idEcopunto;
  }

  get getNombreEmpresa {
    return _nombreEmpresa;
  }

  get getTelefono {
    return _telefono;
  }

  get getTipoDesecho {
    return _tipoDesecho;
  }

  get getLongitud {
    return _longitud;
  }

  get getLatitud {
    return _latitud;
  }

  get getDiaEntrada {
    return _diaEntrada;
  }

  get getDiaSalida {
    return _diaSalida;
  }

  get getHoraEntrada {
    return _horaEntrada;
  }

  get getHoraSalida {
    return _horaSalida;
  }

  set setIdEcopunto(String idEcopunto) {
    _idEcopunto = idEcopunto;
    notifyListeners();
  }

  set setNombreEmpresa(String nombreEmpresa) {
    _nombreEmpresa = nombreEmpresa;
    notifyListeners();
  }

  set setTelefono(String telefono) {
    _telefono = telefono;
    notifyListeners();
  }

  set setTipoDesecho(String tipoDesecho) {
    _tipoDesecho = tipoDesecho;
    notifyListeners();
  }

  set setLongitud(String longitud) {
    _longitud = longitud;
    notifyListeners();
  }

  set setLatitud(String latitud) {
    _latitud =latitud;
    notifyListeners();
  }

  set setDiaEntrada(String diaEntrada) {
    _diaEntrada = diaEntrada;
    notifyListeners();
  }

  set setDiaSalida(String diaSalida) {
    _diaSalida = diaSalida;
    notifyListeners();
  }

  set setHoraEntrada(String horaEntrada){
    _horaEntrada=horaEntrada;
    notifyListeners();
  }

  set setHoraSalida(String horaSalida) {
   _horaSalida=horaSalida;
    notifyListeners();
  }

}