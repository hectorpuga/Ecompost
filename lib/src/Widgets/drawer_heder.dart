import 'package:flutter/material.dart';

class DrawerHederWidget extends StatelessWidget {
  String? url;
  String? nombre;
  DrawerHederWidget({Key? key, required this.url, required this.nombre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            right: 5,
            child: IconButton(
                iconSize: 40,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 40, top: 80),
            child: Column(
              children: [
                GestureDetector(
                    child: CircleAvatar(
                        backgroundImage:
                            url != null ? NetworkImage(url!) : null,
                        radius: 70,
                        backgroundColor: Color(0xffC4D428)),
                    onTap: () => {
                          // TODO Funcion para agregar Imagen
                        }),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  nombre ?? 'Usuarion sin nombre',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Text('Usuario',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
