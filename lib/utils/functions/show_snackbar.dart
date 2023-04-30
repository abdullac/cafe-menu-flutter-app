import 'package:cafemenu_app/main.dart';
import 'package:flutter/material.dart';

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
