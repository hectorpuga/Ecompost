import 'package:ecompost/src/Provider/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowDialogOpciones {
  static void showOptions(BuildContext context, ImagePickerFoto verImage) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: <Widget>[
              ListTile(
                  title: const Text("Camara"),
                  leading: const Icon(Icons.camera_alt),
                  onTap: () {
                    Navigator.pop(context);
                    verImage.pickImage(source: ImageSource.camera);
                  }),
              ListTile(
                  title: const Text("Galeria"),
                  leading: const Icon(Icons.image),
                  onTap: () {
                    Navigator.pop(context);
                    verImage.pickImage(source: ImageSource.gallery);
                  }),
              ListTile(
                  title: const Text("Eliminar"),
                  leading: const Icon(Icons.delete),
                  onTap: () {
                    Navigator.pop(context);
                    verImage.elimnar();
                  })
            ],
          );
        });
  }
}
