import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;

  const AdaptiveFlatButton(this.text, this.handler, {super.key});
  // const AdaptiveFlatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoButton(
      onPressed: handler,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ) : TextButton(
      onPressed: handler,
      style: TextButton.styleFrom(foregroundColor: Colors.blueAccent),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
