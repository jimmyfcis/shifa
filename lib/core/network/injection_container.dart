import 'package:get_it/get_it.dart';
import 'package:shifa/core/storage/token_storage.dart';

import '../../features/authentication/data/datasources/auth_remote_datasource.dart';
import '../../features/authentication/data/repositories/auth_repository_impl.dart';
import '../../features/authentication/domain/repositories/auth_repository.dart';
import '../../features/authentication/domain/use_cases/login_usecase.dart';
import '../../features/authentication/presentation/cubit/login_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(() => LoginCubit(loginUseCase: sl()));

  // Usecases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
    remoteDatasource: sl(),
    tokenStorage: sl(),
  ));

  // Datasources
  sl.registerLazySingleton(() => AuthRemoteDatasource());

  // Core
  sl.registerLazySingleton(() => TokenStorage());
}
