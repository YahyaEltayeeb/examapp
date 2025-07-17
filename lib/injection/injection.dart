import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../ApiManager/ApiService/ApiService.dart';
import '../ApiManager/Dio/Dio.dart';

// import 'features/auth/data/datasources/auth_remote_datasource.dart';
// import 'features/auth/data/repositories/auth_repository_impl.dart';
// import 'features/auth/domain/repositories/auth_repository.dart';
// import 'features/auth/domain/usecases/login_usecase.dart';
// import 'features/auth/presentation/cubit/auth_cubit.dart';
// import 'ApiManager/ApiManager.dart';
// import 'ApiManager/Dio/Dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final dio = DioClient.createDio();
  sl.registerLazySingleton<Dio>(() => dio);

  // API Service
  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  // Data sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //       () => AuthRemoteDataSourceImpl(sl()),
  // );
  //
  // // Repositories
  // sl.registerLazySingleton<AuthRepository>(
  //       () => AuthRepositoryImpl(sl()),
  // );
  //
  // // Use cases
  // sl.registerLazySingleton(() => LoginUseCase(sl()));
  //
  // // Cubit
  // sl.registerFactory(() => AuthCubit(sl()));
}
