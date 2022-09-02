import 'package:flutter/material.dart';

class SnackbarService {
  static SnackBar _makeSnackBar(String message) => SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      );

  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _makeSnackBar(message),
    );
  }
}
