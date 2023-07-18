import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerFoto extends ChangeNotifier {
  File? image;
  String _url = '';
  String _nombre = '';

  void elimnar() {
    image = null;
    notifyListeners();
  }

  Future pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      this.image = imageTemporary;
      // ignore: nullable_type_in_catch_clause
    } on PlatformException catch (e) {
      print(e);
    }

    notifyListeners();
  }

  get getNombre {
    return _nombre;
  }

  get getUrl {
    return _url;
  }

  set setUrl(String _urli) {
    _url = _urli;
    notifyListeners();
  }

  set setName(String nameu) {
    _nombre = nameu;
    notifyListeners();
  }
}
