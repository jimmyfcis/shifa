import 'package:get_it/get_it.dart';
import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/Booking/data/datasources/appointment_remote_data_source.dart';
import 'package:shifa/features/Booking/data/repositories/appointment_repository_impl.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';
import 'package:shifa/features/Booking/domain/usecases/get_appointments_usecase.dart';
import 'package:shifa/features/Booking/presentation/cubit/appointment_cubit.dart';
import 'package:shifa/features/Contact%20us/data/data_source/contact_us_remote_data_source.dart';
import 'package:shifa/features/Contact%20us/data/repositories/contact_us_repository_impl.dart';
import 'package:shifa/features/Contact%20us/domain/repositories/contact_us_repository.dart';
import 'package:shifa/features/Contact%20us/domain/use_cases/send_contact_form_use_case.dart';
import 'package:shifa/features/Contact%20us/presentation/cubit/contact_us_cubit.dart';
import 'package:shifa/features/Doctors/data/data_source/doctor_remote_data_source.dart';
import 'package:shifa/features/Doctors/data/repositories/doctor_repo_impl.dart';
import 'package:shifa/features/Doctors/domain/repositories/doctor_repo.dart';
import 'package:shifa/features/Doctors/domain/use_cases/get_doctor_details_use_case.dart';
import 'package:shifa/features/Doctors/presentation/doctor_cubit.dart';
import 'package:shifa/features/Home/data/data_source/home_remote_data_source.dart';
import 'package:shifa/features/Home/domain/repositories/home_repository.dart';
import 'package:shifa/features/Home/domain/use_cases/get_top_doctors_usecase.dart';
import 'package:shifa/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shifa/features/Radiology/data/data_source/radiology_remote_data_source.dart';
import 'package:shifa/features/Radiology/data/repositories/radiology_repository_impl.dart';
import 'package:shifa/features/Radiology/domain/repositories/radiology_repository.dart';
import 'package:shifa/features/Radiology/domain/use_cases/get_radiologies_use_case.dart';
import 'package:shifa/features/Radiology/presentation/radiology_cubit.dart';
import 'package:shifa/features/authentication/domain/use_cases/register_use_case.dart';
import '../../features/Home/data/repositories/home_repository_impl.dart';
import '../../features/My Records/data/data_source/visit_remote_data_source.dart';
import '../../features/My Records/data/repositories/visit_repository_impl.dart';
import '../../features/My Records/domain/repositories/visit_repository.dart';
import '../../features/My Records/domain/use_cases/get_my_visits_use_case.dart';
import '../../features/My Records/presentation/visit_cubit.dart';
import '../../features/authentication/data/datasources/auth_remote_datasource.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/domain/use_cases/login_usecase.dart';
import '../../features/authentication/domain/use_cases/logout_use_case.dart';
import '../../features/authentication/presentation/cubit/login/login_cubit.dart';
import '../../features/authentication/presentation/cubit/logout/logout_cubit.dart';
import '../../features/Clinics/data/data_source/clinics_remote_data_source.dart';
import '../../features/Clinics/data/repositories/clinics_repository_impl.dart';
import '../../features/Clinics/domain/repositories/clinics_repository.dart';
import '../../features/Clinics/domain/use_cases/get_clinics_use_case.dart';
import '../../features/Clinics/presentation/cubit/clinics_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Data sources
  sl.registerLazySingleton<DoctorRemoteDataSource>(
    () => DoctorRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<ClinicsRemoteDataSource>(
    () => ClinicsRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ContactUsRemoteDataSource>(
    () => ContactUsRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AppointmentRemoteDataSource>(
    () => AppointmentRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<VisitRemoteDataSource>(
    () => VisitRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<RadiologyRemoteDataSource>(
    () => RadiologyRemoteDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<DoctorRepository>(
    () => DoctorRepositoryImpl(
      doctorRemoteDataSource: sl<DoctorRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(
      homeRemoteDataSource: sl<HomeRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDatasource: sl<AuthRemoteDatasource>(),
      tokenStorage: sl<TokenStorage>(),
    ),
  );
  sl.registerLazySingleton<ClinicsRepository>(
    () => ClinicsRepositoryImpl(
      clinicsRemoteDataSource: sl<ClinicsRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<ContactUsRepository>(
    () => ContactUsRepositoryImpl(
      contactUsRemoteDataSource: sl<ContactUsRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepositoryImpl(
      remoteDataSource: sl<AppointmentRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<VisitRepository>(
    () => VisitRepositoryImpl(
      visitRemoteDataSource: sl<VisitRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<RadiologyRepository>(
    () => RadiologyRepositoryImpl(
      radiologyRemoteDataSource: sl<RadiologyRemoteDataSource>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetDoctorDetailsUseCase>(
    () => GetDoctorDetailsUseCase(sl<DoctorRepository>()),
  );
  sl.registerLazySingleton<GetTopDoctorsUseCase>(
    () => GetTopDoctorsUseCase(sl<HomeRepository>()),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<GetClinicsUseCase>(
    () => GetClinicsUseCase(sl<ClinicsRepository>()),
  );
  sl.registerLazySingleton<SendContactFormUseCase>(
    () => SendContactFormUseCase(sl<ContactUsRepository>()),
  );
  sl.registerLazySingleton<GetAppointmentsUseCase>(
    () => GetAppointmentsUseCase(repository: sl<AppointmentRepository>()),
  );
  sl.registerLazySingleton<GetMyVisitsUseCase>(
    () => GetMyVisitsUseCase(sl<VisitRepository>()),
  );
  sl.registerLazySingleton<GetRadiologiesUseCase>(
    () => GetRadiologiesUseCase(sl<RadiologyRepository>()),
  );

  // Presentation (Cubit)
  sl.registerFactory<DoctorCubit>(
    () => DoctorCubit(getDoctorDetailsUseCase: sl<GetDoctorDetailsUseCase>()),
  );
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(getTopDoctorsUseCase: sl<GetTopDoctorsUseCase>()),
  );
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(loginUseCase: sl<LoginUseCase>(), registerUseCase: sl<RegisterUseCase>()),
  );
  sl.registerFactory<LogoutCubit>(
    () => LogoutCubit(logoutUseCase: sl<LogoutUseCase>()),
  );
  sl.registerFactory<ClinicsCubit>(
    () => ClinicsCubit(getClinicsUseCase: sl<GetClinicsUseCase>()),
  );
  sl.registerFactory<ContactUsCubit>(
    () => ContactUsCubit(sendContactFormUseCase: sl<SendContactFormUseCase>()),
  );
  sl.registerFactory<AppointmentCubit>(
    () => AppointmentCubit(getAppointmentsUseCase: sl<GetAppointmentsUseCase>()),
  );
  sl.registerFactory<VisitCubit>(
    () => VisitCubit(getMyVisitsUseCase: sl<GetMyVisitsUseCase>()),
  );
  sl.registerFactory<RadiologyCubit>(
    () => RadiologyCubit(getRadiologiesUseCase: sl<GetRadiologiesUseCase>()),
  );
}
