import 'package:ecompost/src/Screens/mostrar_empresa.dart';
import 'package:ecompost/src/Widgets/drawer.dart';
import 'package:ecompost/src/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/image_picker.dart';
import 'mapa.dart';

class Home extends StatelessWidget {
  static const String name = "Home";
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<ImagePickerFoto>(context);

    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return Container(
              width: 56,
              decoration: BoxDecoration(
                  color: const Color(0xFF5A4E3C),
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 40,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          }),
          backgroundColor: const Color(0xFF5A4E3C),
          actions: [
            Container(
              width: 56,
              decoration: BoxDecoration(
                  color: const Color(0xFF5A4E3C),
                  borderRadius: BorderRadius.circular(40)),
              child: IconButton(
                icon: const Icon(
                  Icons.search_outlined,
                  size: 40,
                ),
                onPressed: () =>
                    showSearch(context: context, delegate: LugaresSearch()),
              ),
            ),
          ],
        ),
        body: const Mapa(),
        drawer: const DrawerWidget(),
        );
  }
}
