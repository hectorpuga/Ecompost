import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'person': Icons.person,
  'store': Icons.store,
  'sunny': Icons.sunny,
  'info': Icons.info,
  'cerrarSesion': Icons.login_outlined
};
Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.black,
  );
}
