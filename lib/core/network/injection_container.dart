import 'package:get_it/get_it.dart';
import 'package:shifa/core/storage/token_storage.dart';
import 'package:shifa/features/Home/data/data_source/home_remote_data_source.dart';
import 'package:shifa/features/Home/domain/repositories/home_repository.dart';
import 'package:shifa/features/Home/domain/use_cases/get_top_doctors_usecase.dart';
import 'package:shifa/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shifa/features/authentication/domain/use_cases/register_use_case.dart';
import '../../features/Home/data/repositories/home_repository_impl.dart';
import '../../features/authentication/data/datasources/auth_remote_datasource.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/domain/use_cases/login_usecase.dart';
import '../../features/authentication/domain/use_cases/logout_use_case.dart';
import '../../features/authentication/presentation/cubit/login/login_cubit.dart';
import '../../features/authentication/presentation/cubit/logout/logout_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );

  // Repositories
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

  // Use cases
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

  // Presentation (Cubit)
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(getTopDoctorsUseCase: sl<GetTopDoctorsUseCase>()),
  );
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(loginUseCase: sl<LoginUseCase>(), registerUseCase: sl<RegisterUseCase>()),
  );
  sl.registerFactory<LogoutCubit>(
    () => LogoutCubit(logoutUseCase: sl<LogoutUseCase>()),
  );
}
