import 'package:flutter/material.dart';

class datosEco extends ChangeNotifier {
  List<String> id=[];
  List<String> nomEco=[];
  int numEco=0;

  get getIdEco{
    return id;
  }

  get getNomEco {
    return nomEco;
  }
  
  get getNumEco{
    return numEco;
  }

}