import 'package:flutter/material.dart';

class LoginForm extends ChangeNotifier {
  String email = '';
  String password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValiForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
