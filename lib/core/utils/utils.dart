import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:shifa/core/network/api_endpoints.dart';
import 'package:shifa/core/network/dio_client.dart';

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
}
