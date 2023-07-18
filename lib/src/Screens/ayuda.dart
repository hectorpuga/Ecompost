import 'package:flutter/material.dart';

class Ayuda extends StatelessWidget {
  static const String name = "Ayuda";
  const Ayuda({super.key});

  @override
  Widget build(BuildContext context) {
    final tituloEstilo = Theme.of(context).textTheme.headline1;

    // ignore: prefer_const_constructors
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Row(
                children: const [
                  Text(
                    'Ayuda',
                    style: TextStyle(
                      color: Color.fromARGB(255, 90, 78, 60),
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_literals_to_create_immutables

            const ExpansionTile(
              title: Text('¿Cómo registro ecopuntos?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Entro a la pantalla principal.\n2.-Me dirigo al menu lateral.\n3.-Doy Click en el boton de Crear Ecompuntos.\n4.-Ingreso los datos solicitados.\n5.-Eligo La ubicacion.\n6.-Doy en el boton de guardar.')),
              ],
            ),
            const ExpansionTile(
              title: Text('¿Cómo cerrar sesión?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Entro a la pantalla principal.\n2.-Me dirijo al menú lateral.\n3.-Me dirijo a la parte inferior del menú lateral.\n4.-Doy click en el botón de cerrar sesión.\n5.-Confirmo en el mensaje emergente la desición.')),
              ],
            ),
            const ExpansionTile(
              title: Text('¿Cómo registrar un usuario?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Ingreso el nombre.\n2.-Ingreso el correo electronico que este activo.\n3.-Ingresamos la contraseña, maximo 8 caracteres y debera contener letras y numeros.\n4.-Volvemos a ingresar la contraseña para confirmarlo.\n5.-Hacemos click en el cuadro de aceptar los terminos y avisos de privacidad.\n6.-Damos click en el boton de registrar para que se almacene la información.')),
              ],
            ),
            const ExpansionTile(
              title: Text('¿cómo entrar en la sección de favoritos?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Entro a la pantalla principal.\n2.-Me dirijo al menú lateral.\n3.-Doy click en la opción de favoritos.\n4.-Se mostraran tus ecopuntos favoritos.')),
              ],
            ),
            const ExpansionTile(
              title: Text('¿cómo reportar un problema?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Entro a la pantalla principal.\n2.-Me dirijo al menú lateral.\n3.-Doy click en la opción de "Reportar un problema".\n4.-Ingreso los datos solicitados.\n5.-Doy en el boton de enviar.')),
              ],
            ),
            const ExpansionTile(
              title: Text('Ver información de un ecopunto de interés'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Buscar el punto de interés.\n2.-Dar un toque en el símbolo del ecopunto.\n3.-Se desplegará la pantalla de información de ese ecopunto.')),
              ],
            ),
            const ExpansionTile(
              title: Text('¿Cómo modificar tu cuenta de perfil?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-Una vez iniciado sesión, despliega el menú de opciones desplegable que se ubica en el lado izquierdo superior.\n2.-Selecciona la opción de cuenta.\n3.-Si deseas modificar el nombre  del usuario, ingresar uno nuevo.\n4.-Si deseas modificar el correo por un nuevo, ingresar nuevo correo.\n5.-Cambiar la contraseña y confirmarla en caso de que desees cambiarla\n6.-Confirmar cambios con el botón superior izquierdo, y en caso de descartar cambios, con el botón superior izquierdo.\nNota:Cualquier opción se puede omitir en caso de no querer cambiar alguna.')),
              ],
            ),
            const ExpansionTile(
              title: Text('¿Cómo eliminar alguno de tus Ecopuntos?'),
              children: <Widget>[
                ListTile(
                    title: Text(
                        textAlign: TextAlign.justify,
                        '1.-En la pantalla principal.\n2.-Me dirijo al menú lateral.\n3.-Doy clic en la opción "Tus Ecopuntos".\n4.-Se desplegarán todos tus Ecopuntos.\n5.-Elegimos el que queramos eliminar.\n6.-Entraremos a la pantalla para editar Ecopuntos, donde aparecerán los datos del Ecopunto.\n7.-En la parte inferior del todo estará un botón para eliminar Ecopuntos.\n8.-Damos click.')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
