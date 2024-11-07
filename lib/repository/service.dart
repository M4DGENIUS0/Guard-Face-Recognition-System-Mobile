import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class AttendanceService {
  final Dio dio;

  AttendanceService(
      {String baseUrl = 'https://7083-34-32-162-171.ngrok-free.app'})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ));
  Future<Map<String, dynamic>> markAttendance(File imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: 'image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      final response = await dio.post('/verify', data: formData);
      return response.data;
    } catch (e) {
      throw Exception('Failed to mark attendance: $e');
    }
  }
}
