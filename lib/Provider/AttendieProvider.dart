import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gfrs/repository/service.dart';
import 'package:image_picker/image_picker.dart';

class AttendieProvider with ChangeNotifier {
  bool isLoading = false;
  bool Mark = false;
  String? apiKey;

  // Setter to update API key
  void setApiKey(String key) {
    apiKey = key;
    notifyListeners();
  }

  Future<void> markAttendance(BuildContext context) async {
    if (apiKey == null) {
      // Handle missing API key
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please provide an API key.')),
      );
      return;
    }

    final GFRAttendanceService service = GFRAttendanceService(APIKey: apiKey!);

    try {
      isLoading = true;
      notifyListeners();

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 85,
      );

      if (image == null) {
        isLoading = false;
        notifyListeners();
        return;
      }

      final result = await service.markAttendance(File(image.path));

      if (result['status'] == 'success') {
        Mark = true;
        showAlertDialog(context, "${result["status"]}",
            "${result["message"]}\n${result['guard']['name']}", Colors.green);
      } else {
        Mark = false;
        showAlertDialog(
            context,
            "${result["status"]}",
            "${result['message']} \nAnti Proof Score: ${result["anti_spoof_score"]}",
            Colors.red);
      }

      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Existing showAlertDialog method
}

void showAlertDialog(
    BuildContext context, String title, String content, Color color) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content, style: TextStyle(color: color)),
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
}
