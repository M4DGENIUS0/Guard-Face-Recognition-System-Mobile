import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback tap;
  const DialogBox({super.key, required this.tap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(actions: [
      TextButton(onPressed: tap, child: Text('Request')),
      
    ],
    title: Text("Permission Check"),
    content: Text("Enable Camera Permission."),
    );
  }
}