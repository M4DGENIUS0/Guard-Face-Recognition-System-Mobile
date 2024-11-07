import 'package:flutter/material.dart';

class Alertdialog extends StatelessWidget {
  final String title;
  final String Content;
  const Alertdialog({super.key, required this.title, required this.Content});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("title"),
          content: Text(Content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    });
    return Container();
  }
}
