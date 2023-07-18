import 'package:flutter/material.dart';

class TerminosyPrivacidad extends StatelessWidget {
  static const String name = "TerminosyPrivacidad";
  const TerminosyPrivacidad({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tituloEstilo = Theme.of(context).textTheme.headline1;
    final subtituloEstilo = Theme.of(context).textTheme.headline6;
    final textoEstilo = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              //Boton regresar pantalla
              IconButton(
                iconSize: size.width * 0.1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Terminos y Aviso de privacidad de Ecompost',
            style: tituloEstilo,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Ecompost se compromete a proteger su privacidad. Este aviso de privacidad explica cómo Ecompost recopila y usa su información personal.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Este aviso de privacidad se aplica a nuestra aplicación Ecompost. Al acceder o utilizar nuestra aplicación, usted indica que ha leído, comprendido y aceptado nuestra recopilación de su información personal, almacenamiento, como se describe en nuestros términos y condiciones.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '¿Qué información recopilamos?',
            style: subtituloEstilo,
            textAlign: TextAlign.center,
          ),
          Text(
            'Recopilamos información suya cuando utiliza nuestra aplicación, al momento de registrarse en esta, como usuario o como empresa.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
              '-Nombre \n-Números de teléfono \n-Correos electrónicos \n-Contraseña \n-Dirección',
              style: textoEstilo),
          const SizedBox(
            height: 5,
          ),
          Text(
              'También recopilamos información de dispositivos móviles para una mejor experiencia de usuario, aunque estas funciones son completamente opcionales:',
              style: textoEstilo),
          const SizedBox(
            height: 10,
          ),
          Text('Ubicación (GPS):',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'Los datos de ubicación ayudan a crear una representación de su ubicación precisa y así facilitar la visualización de los ecopuntos a su alrededor.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Cámara (imágenes):',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'Otorgar permiso a la cámara le permite al usuario cargar cualquier imagen directamente desde la plataforma, puede denegar de manera segura los permisos de la cámara para esta aplicación.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Galería de fotos (imágenes):',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'Otorgar acceso a la galería de fotos permite al usuario cargar cualquier imagen de su galería de fotos. Puede denegar el acceso a la galería de fotos de manera segura para esta aplicación.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('¿Compartimos la información que recopilamos con terceros?',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'No compartimos la información personal que recopilamos. Pero si podemos compartir la información ingresada del ecopunto que se haya registrado a los demás usuarios con acceso a Ecompost.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('¿Cómo usamos la información que recopilamos?',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'Esta información la utilizamos para el registro e inicio de sesión del usuario, en cambio la información proporcionada al momento de registro de ecopunto, se utiliza con la finalidad de brindarle a los demás usuarios la información necesaria que se conocer saber sobre este.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('¿Cómo utilizamos su dirección de correo electrónico?',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'Se utiliza con el fin de realizar el registro e inicio de sesión de usuario solamente, no implica spam o publicidad externa.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('¿Cómo protegemos su información?',
              style: subtituloEstilo, textAlign: TextAlign.center),
          Text(
            'Implementamos una variedad de medidas de seguridad para mantener la garantía de su información personal cuando ingresa o accede a su información personal. Ofrecemos el uso de un servidor seguro.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Tecnologías de Seguimiento',
              style: subtituloEstilo, textAlign: TextAlign.center),
          const SizedBox(
            height: 5,
          ),
          Text('API de Google Maps',
              style: subtituloEstilo, textAlign: TextAlign.center),
          const SizedBox(
            height: 5,
          ),
          Text(
            'La API de Google Maps es una herramienta sólida que se puede utilizar para crear un mapa personalizado, un mapa de búsqueda, funciones de registro, mostrar la sincronización de datos en vivo con la ubicación.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'La API de Google Maps puede recopilar información suya y de su dispositivo por motivos de seguridad.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'La API de Google Maps recopila información que se mantiene de acuerdo con su Política de privacidad.',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Contáctenos',
            style: subtituloEstilo,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'No dude en contactarnos si tiene alguna pregunta. A través de correo electrónico: ecompost_help@gmail.com ',
            style: textoEstilo,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }
}
