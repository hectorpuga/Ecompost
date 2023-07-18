import 'package:flutter/cupertino.dart' show ChangeNotifier;
import 'package:permission_handler/permission_handler.dart';
import '../request/request_page.dart';
import '../Screens/screens.dart';

class SplashController extends ChangeNotifier{
  final   Permission _locationPermision;
  String? _routeName;
  String? get routeName =>_routeName;

  SplashController(this._locationPermision);

  Future<void> checkPermission()async {
    final isGranted = await _locationPermision.isGranted;
    _routeName=isGranted ? Home.name : RequestPage.name;
    notifyListeners();
  }  
}