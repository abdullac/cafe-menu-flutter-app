import 'package:cafemenu_app/main.dart';
import 'package:flutter/material.dart';

/// this method for show snackbar,
/// desplay a message/iformation to user
/// like warning,error,..
showSnackBar(dynamic message) {
  ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: const TextStyle(color: Colors.red),
      ),
    ),
  );
}
