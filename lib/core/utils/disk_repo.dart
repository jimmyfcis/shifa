// import 'dart:async';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shifa/features/clinic/models/doctor_model.dart';
//
// import '../../features/authentication/models/register_model.dart';
//
// const String _organizationKey = "organization";
// const String _registerKey = "registerData";
// const String _bookingDoctorKey = "bookingDoctor";
// const String _listBookingDoctorKey = "listBookingDoctor";
//
// class DiskRepo {
//   static final DiskRepo _singleton = DiskRepo._internal();
//
//   factory DiskRepo() => _singleton;
//
//   DiskRepo._internal();
//
//   late SharedPreferences sharedPreferences;
//
//   Future ensureInitialized() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//   Future<void> saveRegisterData(RegisterModel model) async {
//     await sharedPreferences.setString(_registerKey, model.encode());
//   }
//   Future<void> saveBookingDoctor(Doctor doctor) async {
//     await sharedPreferences.setString(_bookingDoctorKey, doctor.encode());
//   }
//   Future<Doctor?> getBookingDoctor() async {
//     final jsonString = sharedPreferences.getString(_bookingDoctorKey);
//     if (jsonString != null) {
//       return Doctor.decode(jsonString);
//     }
//     return null;
//   }
//
//   Future<List<Doctor>?> getListBookingDoctors() async {
//     final jsonString = sharedPreferences.getString(_listBookingDoctorKey);
//     if (jsonString != null) {
//       final List<dynamic> jsonList = json.decode(jsonString);
//       return jsonList.map((item) => Doctor.fromJson(item as Map<String, dynamic>)).toList();
//     }
//     return null;
//   }
//   Future<RegisterModel?> getRegisterData() async {
//     final jsonString = sharedPreferences.getString(_registerKey);
//     if (jsonString != null) {
//       return RegisterModel.decode(jsonString);
//     }
//     return null;
//   }
//   bool? isLeksell() {
//     if (!sharedPreferences.containsKey(_organizationKey)) {
//       return null;
//     }
//     final value = sharedPreferences.getBool(_organizationKey);
//     if (value == null) {
//       return null;
//     }
//     return value;
//   }
// Future<void> addBookingDoctor(Doctor doctor) async {
//   final List<Doctor> doctors = await getListBookingDoctors() ?? [];
//   doctors.add(doctor);
//   final jsonString = json.encode(doctors.map((doc) => doc.toJson()).toList());
//   await sharedPreferences.setString(_listBookingDoctorKey, jsonString);
// }
// }