import 'package:ecompost/src/Provider/image_picker.dart';
import 'package:ecompost/src/utils/show_dialog.dart';
import 'package:flutter/material.dart';

class ContainerCircular extends StatelessWidget {
  final ImagePickerFoto verImage;
  const ContainerCircular({Key? key, required this.verImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print((size.width * 0.4));
    print((size.height * 0.186));

    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffC4D428),
          borderRadius: BorderRadius.circular(100)),
      width: size.width * 0.4,
      height: size.height * 0.185,
      child: verImage.image == null
          ? Stack(
              children: [
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.24,
                  child: IconButton(
                      iconSize: size.width * 0.15,
                      onPressed: () {
                        ShowDialogOpciones.showOptions(context, verImage);
                      },
                      icon: const Icon(Icons.add_circle)),
                ),
              ],
            )
          : Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    verImage.image!,
                    fit: BoxFit.cover,
                    width: size.width * 0.4,
                    height: size.height * 0.185,
                  ),
                ),
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.24,
                  child: IconButton(
                      iconSize: size.width * 0.15,
                      onPressed: () {
                        ShowDialogOpciones.showOptions(context, verImage);
                      },
                      icon: const Icon(Icons.add_circle)),
                ),
              ],
            ),
    );
  }
}
