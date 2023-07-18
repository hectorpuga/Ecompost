import 'package:flutter/material.dart';

class HorarioData extends ChangeNotifier {
  String _horaInicio = '1:00 PM';
  String _horaFinal = '11:00 PM';
  String _diaInicio = "Lunes";
  String _diaFinal = "Domingo";

  get getHoraInicio {
    return _horaInicio;
  }

  get getDiaInicio {
    return _diaInicio;
  }

  set diaInicio(String dia) {
    _diaInicio = dia;
    notifyListeners();
  }

  get getDiaFinal {
    return _diaFinal;
  }

  set diaFinal(String dia) {
    _diaFinal = dia;
    notifyListeners();
  }

  set horaInicio(String data) {
    _horaInicio = data;
    notifyListeners();
  }

  get getHoraFinal {
    return _horaFinal;
  }

  set horaFinal(String data) {
    _horaFinal = data;
    notifyListeners();
  }
}
