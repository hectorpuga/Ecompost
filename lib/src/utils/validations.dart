class Validations {
  static const String patternCorreo =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String patternPassword = r'^([0-9a-zA-Z]{8,15})$';

  static String? getValitadionsRegister(int i, value,
      {String passwordConfirm = '', String password = ''}) {
    switch (i) {
      case 0:
        return value != '' ? null : 'Ingrese un nombre';
      case 1:
        RegExp regExp = RegExp(patternCorreo);
        return regExp.hasMatch(value ?? '') ? null : 'Correo invalido';
      case 2:
        RegExp regExp = RegExp(patternPassword);
        return regExp.hasMatch(value ?? '') ? null : 'Contraseña invalida, debe tener minimo 8 caracteres';

      case 3:
        RegExp regExp = RegExp(patternPassword);
        return regExp.hasMatch(value ?? '') && password == passwordConfirm
            ? null
            : 'Contraseña invalida, debe coincidir con la anterior';
    }
    return null;
  }

  static String? getValitadionsInicioSesion(int i, value) {
    switch (i) {
      case 1:
        RegExp regExp = RegExp(patternCorreo);
        return regExp.hasMatch(value ?? '') ? null : 'Correo invalido';
      case 2:
        RegExp regExp = RegExp(patternPassword);
        return regExp.hasMatch(value ?? '') ? null : 'Contraseña invalida';
    }
    return null;
  }
}
