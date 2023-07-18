import 'package:ecompost/src/request/request_page.dart';
import 'package:ecompost/src/splash/splash_page.dart';
import 'package:ecompost/src/Screens/ayuda.dart';
import 'package:ecompost/src/Screens/reportar_problema.dart';
import 'package:flutter/material.dart';
import 'package:page_route_animator/page_route_animator.dart';
import '../Screens/inicio.dart';
import '../Screens/screens.dart';

getApplicationRoutes(RouteSettings ruta) {
  switch (ruta.name) {
    case Inicio.name:
      return pageAnimation(
          const Inicio(), RouteAnimation.bottomToTopWithFade, ruta);
    case Mapa.name:
      return pageAnimation(
          const Mapa(), RouteAnimation.bottomToTopWithFade, ruta);
    case Home.name:
      return pageAnimation(
          const Home(), RouteAnimation.bottomToTopWithFade, ruta);
    case InicioSesion.name:
      return pageAnimation(
          const InicioSesion(), RouteAnimation.bottomToTopWithFade, ruta);
    case RegistroUsuario.name:
      return pageAnimation(
          const RegistroUsuario(), RouteAnimation.bottomToTopWithFade, ruta);
    case ModificarPerfil.name:
      return pageAnimation(
          const ModificarPerfil(), RouteAnimation.bottomToTopWithFade, ruta);
    case RegistroEcopunto.name:
      return pageAnimation(
          RegistroEcopunto(), RouteAnimation.bottomToTopWithFade, ruta);
    case ModificarEcopunto.name:
      return pageAnimation(
          ModificarEcopunto(), RouteAnimation.bottomToTopWithFade, ruta);
    case MostrarEmpresaScreen.name:
      return pageAnimation( MostrarEmpresaScreen(),
          RouteAnimation.bottomToTopWithFade, ruta);

    case RequestPage.name:
      return pageAnimation(
          const RequestPage(), RouteAnimation.bottomToTopWithFade, ruta);
    case SplashPage.name:
      return pageAnimation(
          const SplashPage(), RouteAnimation.bottomToTopWithFade, ruta);
    case TerminosyPrivacidad.name:
      return pageAnimation(const TerminosyPrivacidad(),
          RouteAnimation.bottomToTopWithFade, ruta);
    case ReportarProblema.name:
      return pageAnimation(
          const ReportarProblema(), RouteAnimation.bottomToTopWithFade, ruta);
    case Ayuda.name:
      return pageAnimation(
          const Ayuda(), RouteAnimation.bottomToTopWithFade, ruta);
  }
}

pageAnimation(Widget pantalla, RouteAnimation animacion, RouteSettings ruta) {
  return PageRouteAnimator(
    child: pantalla,
    routeAnimation: animacion,
    settings: ruta,
    curve: Curves.linear,
    duration: const Duration(milliseconds: 350),
    reverseDuration: const Duration(milliseconds: 350),
  );
}
