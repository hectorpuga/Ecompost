import 'package:ecompost/src/Provider/datosEco.dart';
import 'package:ecompost/src/Models/ecopuntoModel.dart';
import 'package:ecompost/src/Provider/horario_data.dart';
import 'package:ecompost/src/Provider/idCreador.dart';
import 'package:ecompost/src/Provider/prefilDataEco.dart';
import 'package:ecompost/src/Provider/providers.dart';
import 'package:ecompost/src/Screens/inicio.dart';
import 'package:ecompost/src/Services/mapbox.dart';
import 'package:ecompost/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'src/Routes/routes.dart';
import 'src/utils/notificactions.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccionesIcons()),
        ChangeNotifierProvider(create: (_) => ImagePickerFoto()),
        ChangeNotifierProvider(
          create: (_) => MapBox(),
          lazy: true,
        ),
        ChangeNotifierProvider(create: (_) => LoginForm()),
        ChangeNotifierProvider(create: (_) => RegisterForm()),
        ChangeNotifierProvider(create: (_) => RegisterEcopunto()),
        ChangeNotifierProvider(create: (_) => HorarioData()),
        ChangeNotifierProvider(create: (_) => idCreador()),
        ChangeNotifierProvider(create: (_) => datosEco()),
        ChangeNotifierProvider(create: (_) => prefillDataEco()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      scaffoldMessengerKey: Notifications.messegerKey,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const Inicio(),
      onGenerateRoute: (settings) {
        return getApplicationRoutes(settings);
      },
    );
  }
}
