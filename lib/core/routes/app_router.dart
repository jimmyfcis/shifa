import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shifa/features/Blogs/data/models/blog_model.dart';
import 'package:shifa/features/Blogs/screens/blog_detail_screen.dart';
import 'package:shifa/features/Blogs/screens/blogs_screen.dart';
import 'package:shifa/features/Booking/screens/booking_screen.dart';
import 'package:shifa/features/Bottom%20Bar/screens/bottom_bar_screen.dart';
import 'package:shifa/features/Care%20Reminder/screens/care_reminder_screen.dart';
import 'package:shifa/features/Clinic%20Doctors/screens/clinic_doctors_screen.dart';
import 'package:shifa/core/models/clinic_model.dart';
import 'package:shifa/features/Clinics/screens/clinics_screen.dart';
import 'package:shifa/features/Contact%20us/screens/contact_us_screen.dart';
import 'package:shifa/features/Doctors/screens/doctor_profile_screen.dart';
import 'package:shifa/features/Booking/screens/first_booking_screen.dart';
import 'package:shifa/features/Labs/presentation/screens/lab_tests_screen.dart';
import 'package:shifa/features/Medical%20Reminder/screens/medical_reminder_screen.dart';
import 'package:shifa/features/My%20Care/screens/my_care_screen.dart';
import 'package:shifa/features/My%20Favorite/screens/my_favorite_screen.dart';
import 'package:shifa/features/My%20Profile/screens/my_profie_screen.dart';
import 'package:shifa/features/My%20Records/presentation/screens/my_records_screen.dart';
import 'package:shifa/features/My%20Records/presentation/screens/my_visits_screen.dart';
import 'package:shifa/features/Radiology/screens/radiology_screen.dart';
import 'package:shifa/features/Rate%20Your%20Visit/screens/rate_your_visit_screen.dart';
import 'package:shifa/features/Records%20Detail/screens/records_details_screen.dart';
import 'package:shifa/features/Vaccine%20Reminder/screens/new_vaccine_reminder.dart';
import 'package:shifa/features/Vaccine%20Reminder/screens/vaccine_reminder_screen.dart';
import 'package:shifa/features/departments/presentation/screens/department_details_screen.dart';
import 'package:shifa/features/settings/screens/settings_screen.dart';
import 'package:shifa/features/splash/screens/language_splash_screen.dart';
import 'package:shifa/features/splash/screens/splash_screen.dart';
import '../../features/Care Reminder/screens/new_care_reminder_screen.dart';
import '../../features/Booking/screens/second_booking_screen.dart';
import '../../features/Home/presentation/screens/ambulance_screen.dart';
import '../../features/Home/presentation/screens/first_queue_screen.dart';
import '../../features/Home/presentation/screens/home_screen.dart';
import '../../features/Home/presentation/screens/second_queue_screen.dart';
import '../../features/Medical Reminder/screens/new_medicine_reminder_screen.dart';
import '../../features/My Profile/screens/edit_profile_screen.dart';
import '../../features/Privacy Policy/screens/privacy_policy_screen.dart';
import '../../features/Profile/screens/profile_screen.dart';
import '../../features/Terms And Conditions/screens/terms_and_conditions_screen.dart';
import '../../features/authentication/presentation/screens/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/login_screen.dart';
import '../../features/authentication/presentation/screens/register_screen.dart';
import '../../features/authentication/presentation/screens/verify_code_screen.dart';
import '../../features/departments/presentation/screens/departments_screen.dart';
import '../../features/splash/screens/onboarding_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.bottomBar:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BottomBarScreen(index: arguments['index'],),
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.languageSplash:
        return MaterialPageRoute(builder: (_) => const LanguageSplashScreen());
      case AppRoutes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.editProfile:
        return MaterialPageRoute(builder: (_) => const EditMyProfileScreen());
      case AppRoutes.myCare:
        return MaterialPageRoute(builder: (_) => const MyCareScreen());

      case AppRoutes.privacyPolicy:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
      case AppRoutes.termsAndConditions:
        return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());

      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.firstQueueScreen:
        return MaterialPageRoute(builder: (_) => const FirstQueueScreen());
      case AppRoutes.secondQueueScreen:
        return MaterialPageRoute(builder: (_) => const SecondQueueScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.verifyOTP:
        return MaterialPageRoute(builder: (_) => const VerificationCodeScreen());
      case AppRoutes.ambulance:
        return MaterialPageRoute(builder: (_) => const AmbulanceScreen());
      case AppRoutes.secondBookingScreen:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SecondBookingScreen(
            clinicID: arguments['clinicID'],
            date: arguments['date'],
            doctorId: arguments['doctorId'],
            time: arguments['time'],
            image: arguments['image'],
            mobile: arguments['mobile'],
            name: arguments['name'],
            doctor: arguments['doctor'],
          ),
        );
      case AppRoutes.blogs:
        return MaterialPageRoute(builder: (_) => const BlogsScreen());
      case AppRoutes.departments:
        return MaterialPageRoute(builder: (_) => const DepartmentsScreen());
      case AppRoutes.myFavorite:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => MyFavoriteScreen(
                  clinic: arguments['clinic'],
                  doctor: arguments['doctor'],
                ));
      case AppRoutes.labTests:
        return MaterialPageRoute(builder: (_) => const LabTestsScreen());
      case AppRoutes.booking:
        return MaterialPageRoute(builder: (_) => const BookingScreen());
      case AppRoutes.rateYourVisit:
        return MaterialPageRoute(builder: (_) => const RateYourVisitScreen());
      case AppRoutes.radiology:
        return MaterialPageRoute(builder: (_) => const RadiologyScreen());
      case AppRoutes.clinics:
        return MaterialPageRoute(builder: (_) => const ClinicsScreen());
      case AppRoutes.medicalReminder:
        return MaterialPageRoute(builder: (_) => const MedicalReminderScreen());
      case AppRoutes.vaccineReminder:
        return MaterialPageRoute(builder: (_) => const VaccineReminderScreen());
      case AppRoutes.myVisits:
        return MaterialPageRoute(builder: (_) => const MyVisitsScreen());
      case AppRoutes.myRecords:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => MyRecordsScreen(
                  visit: arguments['visit'],
                ));
      case AppRoutes.newVaccineReminder:
        return MaterialPageRoute(builder: (_) => const NewVaccineReminderScreen());
      case AppRoutes.newCareReminder:
        return MaterialPageRoute(builder: (_) => const NewCareReminderScreen());
      case AppRoutes.newMedicineReminderScreen:
        return MaterialPageRoute(builder: (_) => const NewMedicineReminderScreen());
      case AppRoutes.careReminder:
        return MaterialPageRoute(builder: (_) => const CareReminderScreen());
      case AppRoutes.firstBookAppointment:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => FirstBookingScreen(
                  clinicID: arguments['clinicID'],
                  date: arguments['date'],
                  doctorId: arguments['doctorId'],
                  image: arguments['image'],
                  time: arguments['time'],
                  doctor: arguments['doctor'],
                ));
      case AppRoutes.clinicDoctors:
        var clinic = settings.arguments as Clinic;
        return MaterialPageRoute(
            builder: (_) => ClinicDoctorsScreen(
                  clinic: clinic,
                ));
      case AppRoutes.recordsDetails:
        var arguments = settings.arguments as Map<String, dynamic>;
        log(arguments.toString());
        return MaterialPageRoute(
            builder: (_) => RecordsDetailsScreen(
                  radiologyReport: arguments['record'],
                  title: arguments['title'],
                  recordType: arguments['recordType'],
                ));
      case AppRoutes.doctorProfile:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DoctorProfileScreen(
            fromBookings: arguments['fromBookings'],
            clinicId: arguments['clinicId'],
            doctorId: arguments['doctorId'],
            appointment: arguments['appointment'],
          ),
        );
      case AppRoutes.blogDetails:
        final Blog blog = settings.arguments as Blog;
        return MaterialPageRoute(
            builder: (_) => BlogDetailScreen(
                  blog: blog,
                ));
      case AppRoutes.departmentDetails:
        var arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DepartmentDetailsScreen(
            department: arguments['department'],
          ),
        );
      case AppRoutes.myProfile:
        return MaterialPageRoute(builder: (_) => const MyProfile());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
