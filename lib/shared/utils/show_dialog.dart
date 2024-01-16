import 'package:flutter/material.dart';

Future<dynamic> dialogg(
  BuildContext context, {
  required String title,
  required String content,
  bool barrierDismissible = true,
  VoidCallback? onPressed,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onPressed ??
              () {
                Navigator.pop(context);
              },
        )
      ],
    ),
  );
}
