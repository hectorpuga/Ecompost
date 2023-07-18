import 'package:flutter/material.dart';

class Notifications {
  static GlobalKey<ScaffoldMessengerState> messegerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );

    messegerKey.currentState!.showSnackBar(snackBar);
  }
}
