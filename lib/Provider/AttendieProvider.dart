import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gfrs/repository/service.dart';
import 'package:image_picker/image_picker.dart';

class AttendieProvider with ChangeNotifier {
  bool isLoading = false;
  bool Mark = false;
  // Code for Attendie mark
  Future<void> markAttendance(BuildContext context) async {
    try {
      final AttendanceService service = AttendanceService();

      // Set loading to true
      isLoading = true;
      notifyListeners();

      // Capture Photo
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

      // Mark attendance
      final result = await service.markAttendance(File(image.path));

      if (result['status'] == 'success') {
        Mark = true;
        showAlertDialog(context, "${result["status"]}",
            "${result["message"]}\n${result['guard']['name']}");
      } else {
        Mark = false;
        showAlertDialog(context, "${result["status"]}",
            "${result['message']} \nAnti Proof Score: ${result["anti_spoof_score"]}");
      }

      // updating Mark
      notifyListeners();
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      // Set loading to false
      isLoading = false;
      notifyListeners();
    }
  }

  void showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
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
}
