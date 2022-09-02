import 'package:flutter/material.dart';

class DialogService {
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    String message = 'Are you sure?',
    String confirmButtonLabel = 'Confirm',
    String cancelButtonLabel = 'Cancel',
    Color confirmButtonColor = Colors.redAccent,
  }) async {
    bool userAnswer = false;

    await showDialog<bool>(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            MaterialButton(
              onPressed: (() {
                userAnswer = true;

                Navigator.of(context).pop();
              }),
              color: confirmButtonColor,
              child: Text(confirmButtonLabel),
            ),
            MaterialButton(
              onPressed: (() {
                userAnswer = false;

                Navigator.of(context).pop();
              }),
              child: Text(cancelButtonLabel),
            ),
          ],
        );
      }),
    );

    return userAnswer;
  }
}
