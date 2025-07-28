import 'package:get_it/get_it.dart';
import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/Booking/data/datasources/appointment_remote_data_source.dart';
import 'package:shifa/features/Booking/data/repositories/appointment_repository_impl.dart';
import 'package:shifa/features/Booking/domain/repositories/appointment_repository.dart';
import 'package:shifa/features/Booking/domain/usecases/book_appointment_usecase.dart';
import 'package:shifa/features/Booking/domain/usecases/get_appointments_usecase.dart';
import 'package:shifa/features/Booking/presentation/cubit/book%20appointement/book_appointment_cubit.dart';
import 'package:shifa/features/Booking/presentation/cubit/get%20appointemnets/appointment_cubit.dart';
import 'package:shifa/features/Contact%20us/data/data_source/contact_us_remote_data_source.dart';
import 'package:shifa/features/Contact%20us/data/repositories/contact_us_repository_impl.dart';
import 'package:shifa/features/Contact%20us/domain/repositories/contact_us_repository.dart';
import 'package:shifa/features/Contact%20us/domain/use_cases/send_contact_form_use_case.dart';
import 'package:shifa/features/Contact%20us/presentation/cubit/contact_us_cubit.dart';
import 'package:shifa/features/Doctors/data/data_source/doctor_remote_data_source.dart';
import 'package:shifa/features/Doctors/data/repositories/doctor_repo_impl.dart';
import 'package:shifa/features/Doctors/domain/repositories/doctor_repo.dart';
import 'package:shifa/features/Doctors/domain/use_cases/get_doctor_details_use_case.dart';
import 'package:shifa/features/Doctors/domain/use_cases/search_doctors_use_case.dart';
import 'package:shifa/features/Doctors/presentation/doctor_cubit.dart';
import 'package:shifa/features/Home/data/data_source/home_remote_data_source.dart';
import 'package:shifa/features/Home/domain/repositories/home_repository.dart';
import 'package:shifa/features/Home/domain/use_cases/get_top_doctors_usecase.dart';
import 'package:shifa/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shifa/features/Labs/data/data_source/lab_remote_data_source.dart';
import 'package:shifa/features/Labs/data/repositories/lab_repository_impl.dart';
import 'package:shifa/features/Labs/domain/repositories/lab_repository.dart';
import 'package:shifa/features/Labs/domain/use_cases/get_labs_use_case.dart';
import 'package:shifa/features/Labs/presentation/lab_cubit.dart';
import 'package:shifa/features/My%20Records/data/data_source/records_remote_data_source.dart';
import 'package:shifa/features/My%20Records/data/repositories/records_repository_impl.dart';
import 'package:shifa/features/My%20Records/domain/repositories/records_repository.dart';
import 'package:shifa/features/My%20Records/domain/use_cases/get_my_records_use_case.dart';
import 'package:shifa/features/My%20Records/presentation/managers/records/records_cubit.dart';
import 'package:shifa/features/Radiology/data/data_source/radiology_remote_data_source.dart';
import 'package:shifa/features/Radiology/data/repositories/radiology_repository_impl.dart';
import 'package:shifa/features/Radiology/domain/repositories/radiology_repository.dart';
import 'package:shifa/features/Radiology/domain/use_cases/get_radiologies_use_case.dart';
import 'package:shifa/features/Radiology/presentation/radiology_cubit.dart';
import 'package:shifa/features/Records%20Detail/data/data_source/file_remote_data_source.dart';
import 'package:shifa/features/Records%20Detail/data/repository/file_repository_impl.dart';
import 'package:shifa/features/Records%20Detail/domain/repository/file_repository.dart';
import 'package:shifa/features/Records%20Detail/domain/use_cases/file_use_case.dart';
import 'package:shifa/features/Records%20Detail/presntation/managers/file_cubit.dart';
import 'package:shifa/features/ambulance/data/remote_data_source/ambulance_remote_data_source.dart';
import 'package:shifa/features/ambulance/data/repositories/ambulance_repository_impl.dart';
import 'package:shifa/features/ambulance/domain/repositories/ambulance_repository.dart';
import 'package:shifa/features/ambulance/domain/use_cases/request_ambulance_use_case.dart';
import 'package:shifa/features/ambulance/presentation/managers/ambulance_cubit.dart';
import 'package:shifa/features/authentication/domain/use_cases/change_password_use_case.dart';
import 'package:shifa/features/authentication/domain/use_cases/forget_password_use_case.dart';
import 'package:shifa/features/authentication/domain/use_cases/register_use_case.dart';
import 'package:shifa/features/authentication/domain/use_cases/update_profile_use_case.dart';
import 'package:shifa/features/authentication/presentation/cubit/change%20password/change_password_cubit.dart';
import 'package:shifa/features/authentication/presentation/cubit/forget%20password/forget_password_cubit.dart';
import 'package:shifa/features/news/data/datasources/news_remote_data_source.dart';
import 'package:shifa/features/news/data/repositories/news_repository_impl.dart';
import 'package:shifa/features/news/domain/repositories/news_repository.dart';
import 'package:shifa/features/news/domain/usecases/get_news_usecase.dart';
import 'package:shifa/features/news/presentation/cubit/news_cubit.dart';
import 'package:shifa/features/offers/data/datasources/offers_remote_data_source.dart';
import 'package:shifa/features/offers/data/repositories/offers_repository_impl.dart';
import 'package:shifa/features/offers/domain/repositories/offers_repository.dart';
import 'package:shifa/features/offers/domain/usecases/get_offers_usecase.dart';
import 'package:shifa/features/offers/presentation/cubit/offers_cubit.dart';
import '../../features/Doctors/presentation/search_doctors/search_doctor_cubit.dart';
import '../../features/Home/data/repositories/home_repository_impl.dart';
import '../../features/My Records/data/data_source/visit_remote_data_source.dart';
import '../../features/My Records/data/repositories/visit_repository_impl.dart';
import '../../features/My Records/domain/repositories/visit_repository.dart';
import '../../features/My Records/domain/use_cases/get_my_visits_use_case.dart';
import '../../features/My Records/presentation/managers/visits/visit_cubit.dart';
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
import 'package:shifa/features/Booking/domain/usecases/cancel_appointment_usecase.dart';
import 'package:shifa/features/Booking/presentation/cubit/cancel_appointment_cubit.dart';
import 'package:shifa/features/Booking/domain/usecases/reschedule_appointment_usecase.dart';
import 'package:shifa/features/Booking/presentation/cubit/reschedule_appointment_cubit.dart';

import '../../features/departments/data/datasources/departments_remote_data_source.dart';
import '../../features/departments/data/repositories/departments_repository_impl.dart';
import '../../features/departments/domain/repositories/departments_repository.dart';
import '../../features/departments/domain/usecases/get_all_departments.dart';
import '../../features/departments/domain/usecases/get_department_by_id.dart';
import '../../features/departments/presentation/cubit/departments_cubit.dart';

import 'package:shifa/features/Blogs/data/datasources/blogs_remote_data_source.dart';
import 'package:shifa/features/Blogs/data/repositories/blogs_repository_impl.dart';
import 'package:shifa/features/Blogs/domain/repositories/blogs_repository.dart';
import 'package:shifa/features/Blogs/domain/usecases/get_blogs_usecase.dart';
import 'package:shifa/features/Blogs/presentation/cubit/blogs_cubit.dart';

import '../../features/queue/data/datasources/queue_remote_data_source.dart';
import '../../features/queue/data/repositories/queue_repository_impl.dart';
import '../../features/queue/domain/repositories/queue_repository.dart';
import '../../features/queue/domain/usecases/get_tickets_usecase.dart';
import '../../features/queue/presentation/cubit/queue_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Data sources

  sl.registerLazySingleton<DepartmentsRemoteDataSource>(
    () => DepartmentsRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<AmbulanceRemoteDataSource>(
        () => AmbulanceRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<FileRemoteDataSource>(
        () => FileRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<RecordsRemoteDataSource>(
    () => RecordsRemoteDataSourceImpl(),
  );
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
  sl.registerLazySingleton<LabRemoteDataSource>(
    () => LabRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<BlogsRemoteDataSource>(
    () => BlogsRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<OffersRemoteDataSource>(
        () => OffersRemoteDataSourceImpl(),
  );

  // Queue Feature
  sl.registerLazySingleton<QueueRemoteDataSource>(
        () => QueueRemoteDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<DoctorRepository>(
    () => DoctorRepositoryImpl(
      doctorRemoteDataSource: sl<DoctorRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<AmbulanceRepository>(
        () => AmbulanceRepositoryImpl(
      ambulanceRemoteDataSource: sl<AmbulanceRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<DepartmentsRepository>(
    () => DepartmentsRepositoryImpl(
      remoteDataSource: sl<DepartmentsRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<RecordsRepository>(
    () => RecordsRepositoryImpl(
      remoteDataSource: sl<RecordsRemoteDataSource>(),
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
  sl.registerLazySingleton<LabRepository>(
    () => LabRepositoryImpl(
      labRemoteDataSource: sl<LabRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton<BlogsRepository>(
    () => BlogsRepositoryImpl(
      remoteDataSource: sl<BlogsRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<NewsRepository>(
        () => NewsRepositoryImpl(
      remoteDataSource: sl<NewsRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<OffersRepository>(
        () => OffersRepositoryImpl(
      remoteDataSource: sl<OffersRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<FileRepository>(
        () => FileRepositoryImpl(
      remoteDataSource: sl<FileRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<QueueRepository>(
    () => QueueRepositoryImpl(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton<GetDoctorDetailsUseCase>(
    () => GetDoctorDetailsUseCase(sl<DoctorRepository>()),
  );

  sl.registerLazySingleton<SearchDoctorsUseCase>(
        () => SearchDoctorsUseCase(sl<DoctorRepository>()),
  );

  sl.registerLazySingleton<RequestAmbulanceUseCase>(
        () => RequestAmbulanceUseCase(sl<AmbulanceRepository>()),
  );

  sl.registerLazySingleton<GetAllDepartments>(
    () => GetAllDepartments(sl<DepartmentsRepository>()),
  );

  sl.registerLazySingleton<GetDepartmentById>(
    () => GetDepartmentById(sl<DepartmentsRepository>()),
  );

  sl.registerLazySingleton<GetRecordsUseCase>(
    () => GetRecordsUseCase(sl<RecordsRepository>()),
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
  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(sl<AuthRepository>()),
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
  sl.registerLazySingleton<BookAppointmentUseCase>(
    () => BookAppointmentUseCase(repository: sl<AppointmentRepository>()),
  );
  sl.registerLazySingleton<GetMyVisitsUseCase>(
    () => GetMyVisitsUseCase(sl<VisitRepository>()),
  );
  sl.registerLazySingleton<GetRadiologiesUseCase>(
    () => GetRadiologiesUseCase(sl<RadiologyRepository>()),
  );
  sl.registerLazySingleton<GetLabsUseCase>(
    () => GetLabsUseCase(sl<LabRepository>()),
  );
  sl.registerLazySingleton<CancelAppointmentUseCase>(
    () => CancelAppointmentUseCase(repository: sl<AppointmentRepository>()),
  );
  sl.registerLazySingleton<RescheduleAppointmentUseCase>(
    () => RescheduleAppointmentUseCase(repository: sl<AppointmentRepository>()),
  );
  sl.registerLazySingleton<GetBlogsUseCase>(
    () => GetBlogsUseCase(sl<BlogsRepository>()),
  );

  sl.registerLazySingleton<GetNewsUseCase>(
        () => GetNewsUseCase(sl<NewsRepository>()),
  );

  sl.registerLazySingleton<GetFileUseCase>(
        () => GetFileUseCase(repository: sl()),
  );

  sl.registerLazySingleton<GetOffersUseCase>(
        () => GetOffersUseCase(sl<OffersRepository>()),
  );

  sl.registerLazySingleton<GetTicketsUseCase>(
    () => GetTicketsUseCase(repository: sl()),
  );

  sl.registerLazySingleton<ChangePasswordUseCase>(
        () => ChangePasswordUseCase(sl<AuthRepository>()),
  );

  // Presentation (Cubit)
  sl.registerFactory<DoctorCubit>(
    () => DoctorCubit(getDoctorDetailsUseCase: sl<GetDoctorDetailsUseCase>()),
  );

  sl.registerFactory<SearchDoctorCubit>(
        () => SearchDoctorCubit(searchDoctorsUseCase: sl<SearchDoctorsUseCase>()),
  );

  sl.registerFactory<AmbulanceCubit>(
        () => AmbulanceCubit(requestAmbulanceUseCase: sl<RequestAmbulanceUseCase>()),
  );

  sl.registerFactory<DepartmentsCubit>(
    () => DepartmentsCubit(getAllDepartments: sl<GetAllDepartments>(), getDepartmentById: sl<GetDepartmentById>()),
  );
  sl.registerFactory<RecordsCubit>(
    () => RecordsCubit(getRecordsUseCase: sl<GetRecordsUseCase>()),
  );
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(getTopDoctorsUseCase: sl<GetTopDoctorsUseCase>()),
  );

  sl.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(forgetPasswordUseCase: sl<ForgetPasswordUseCase>()),
  );
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      updateProfileUseCase: sl<UpdateProfileUseCase>(),
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
    ),
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
  sl.registerFactory<BookAppointmentCubit>(
    () => BookAppointmentCubit(bookAppointmentUseCase: sl<BookAppointmentUseCase>()),
  );
  sl.registerFactory<VisitCubit>(
    () => VisitCubit(getMyVisitsUseCase: sl<GetMyVisitsUseCase>()),
  );
  sl.registerFactory<RadiologyCubit>(
    () => RadiologyCubit(getRadiologiesUseCase: sl<GetRadiologiesUseCase>()),
  );
  sl.registerFactory<LabCubit>(
    () => LabCubit(getLabsUseCase: sl<GetLabsUseCase>()),
  );
  sl.registerFactory<CancelAppointmentCubit>(
    () => CancelAppointmentCubit(cancelAppointmentUseCase: sl<CancelAppointmentUseCase>()),
  );
  sl.registerFactory<RescheduleAppointmentCubit>(
    () => RescheduleAppointmentCubit(rescheduleAppointmentUseCase: sl<RescheduleAppointmentUseCase>()),
  );
  sl.registerFactory<BlogsCubit>(
    () => BlogsCubit(getBlogsUseCase: sl<GetBlogsUseCase>()),
  );
  sl.registerFactory<NewsCubit>(
        () => NewsCubit(getNewsUseCase: sl<GetNewsUseCase>()),
  );
  sl.registerFactory<OffersCubit>(
        () => OffersCubit(getOffersUseCase: sl<GetOffersUseCase>()),
  );
  sl.registerFactory<ChangePasswordCubit>(
        () => ChangePasswordCubit(changePasswordUseCase: sl()),
  );
  sl.registerFactory<QueueCubit>(
    () => QueueCubit(getTicketsUseCase: sl()),
  );
      sl.registerFactory<FileCubit>(
  () => FileCubit(getFileUseCase: sl()),
  );
}
