import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatGender(String? gender) {
    if (gender == null) return '';
    return gender.toLowerCase() == 'male'||gender.toLowerCase() == 'm'||gender == 'ذكر' ? 'M' : 'F';
  }
  static String formatIDType(String? idType) {
    if (idType == null) return '';
    return idType.toLowerCase() == 'passport'||idType == 'جواز سفر' ? 'Passport' : 'NationalID';
  }
  static void getFcmToken ()async {
  String? token = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $token');

// TODO: Save it to your backend or use as needed
}
}