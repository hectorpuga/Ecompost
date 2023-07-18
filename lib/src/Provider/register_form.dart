import 'package:flutter/material.dart';

class RegisterForm extends ChangeNotifier {
  String nombre = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isCheckt = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValiForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
