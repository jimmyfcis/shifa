import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';
import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class Utils {
  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatGender(String? gender) {
    if (gender == null) return '';
    return gender.toLowerCase() == 'male' || gender.toLowerCase() == 'm' || gender == 'ذكر' ? 'M' : 'F';
  }

  static String formatIDType(String? idType) {
    if (idType == null) return '';
    return idType.toLowerCase() == 'passport' || idType == 'جواز سفر' ? 'Passport' : 'NationalID';
  }

  static void getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    final Dio dio = DioClient().dio;
    await dio.post(ApiEndpoints.saveFCM, data: {"fcm_token": token});
  }

  static String extractTextFromHTML (String html){
    RegExpMatch? match;
    String paragraph='';
    if(html.contains("youtube"))
      {
        final regex = RegExp(r'src="(https:\/\/www\.youtube\.com\/embed\/[a-zA-Z0-9_-]+)"');
         match = regex.firstMatch(html);
        paragraph=(match != null ? match.group(1)! : '').toString();
      }
      final document = parse(html);
      return "${document.body?.text.trim() ?? ''}\n $paragraph";

  }

 String? getFileName(String base64){
try{
  final bytes = base64Decode(base64);

  // Guess mime type
  final mimeType = lookupMimeType('', headerBytes: bytes);
  print('Detected mimeType: $mimeType');

  // Generate file extension
  String extension = _extensionFromMime(mimeType);
  String fileName = 'file_${DateTime.now().millisecondsSinceEpoch}.$extension';

  return fileName;
} catch (e) {
  print('Error: $e');
  }
return null;

}
  Future<void> openFileFromBase64(String base64Str) async {
    try {
      // Decode base64
      final bytes = base64Decode(base64Str);

      // Guess mime type
      final mimeType = lookupMimeType('', headerBytes: bytes);
      print('Detected mimeType: $mimeType');

      // Generate file extension
      String extension = _extensionFromMime(mimeType);
      String fileName = 'file_${DateTime.now().millisecondsSinceEpoch}.$extension';

      // Write to temp file
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(bytes);

      // Open externally
      final result = await OpenFile.open(file.path);
      print('Open result: ${result.message}');
    } catch (e) {
      print('Error: $e');
    }
  }

// Helper to map MIME to file extension
  String _extensionFromMime(String? mimeType) {
    switch (mimeType) {
      case 'application/pdf':
        return 'pdf';
      case 'image/png':
        return 'png';
      case 'image/jpeg':
        return 'jpg';
      case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
        return 'docx';
      case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
        return 'xlsx';
      case 'text/plain':
        return 'txt';
      default:
        return 'bin'; // fallback
    }
  }
}
