import 'package:flutter/material.dart';

class AccionesIcons extends ChangeNotifier {
  bool _favorite = false;
  bool _checkboxValor = false;
  final List<bool> _puntuacion = [false, false, false, false, false];

  bool get favorite => _favorite;

  List<bool> get reacciones => _puntuacion;

  set isFavorite(bool value) {
    _favorite = value;
    notifyListeners();
  }

  isPuntuacion(bool value, int a) {
    if (value) {
      for (var i = 0; i < (a + 1); i++) {
        _puntuacion[i] = value;
      }
    } else {
      for (var i = 4; i >= a; i--) {
        _puntuacion[i] = value;
      }
    }
    notifyListeners();
  }

  bool get checkValor => _checkboxValor;

  set isCheckValor(bool value) {
    _checkboxValor = value;
    notifyListeners();
  }
}
