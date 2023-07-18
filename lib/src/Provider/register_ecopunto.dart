import 'package:flutter/material.dart';

class RegisterEcopunto extends ChangeNotifier {
  String _nombreEmpresa = '';
  String _Telefono = '';
  String _desecho = '';
  String Horario = '';

  get getNombreEmpresa {
    return _nombreEmpresa;
  }

  get getTelefono{
    return _Telefono;
  }

  get getDesecho {
    return _desecho;
  }

  set setNombreEmpresa(String nombreEmpresa){
    _nombreEmpresa = nombreEmpresa;
    notifyListeners();
  }

  set setTelefono(String telefono){
    _Telefono = telefono;
    notifyListeners();
  }

  set setDesecho(String desecho){
    _desecho = desecho;
    notifyListeners();
  }

}