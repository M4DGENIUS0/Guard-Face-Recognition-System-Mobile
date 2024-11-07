import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InternetErrorDialogBox extends StatelessWidget {
  const InternetErrorDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Internet Status"),
      content: const Text(
          'Your not connected to internet, turn on wifi/Cellular to connect'),
      actions: [
        TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
            },
            child: const Text("Exit"))
      ],
    );
  }
}
