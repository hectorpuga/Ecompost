import 'package:flutter/material.dart';

class ReportarProblema extends StatelessWidget {
  static const String name = "ReportarProblema";
  const ReportarProblema({super.key});

  @override
  Widget build(BuildContext context) {
    final tituloEstilo = Theme.of(context).textTheme.headline1;
    final sized = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Row(
                children: [
                  Text(
                    'Reportar un problema',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 90, 78, 60),
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: sized.width * 0.08,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
              child: Form(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'Tipo de problema',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Ingrese el problema',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Describa el problema',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText: 'Describa el problema aquí',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Correo',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Ingrese su correo',
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      child: const Text("Seleccionar imagen"),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      child: const Text("Enviar"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
