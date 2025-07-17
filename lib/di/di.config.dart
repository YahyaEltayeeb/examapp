// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;
import '../ApiManager/ApiService/ApiService.dart' as _i699;
import '../ApiManager/dataSource/LoginRemoteDataSourceIMPL.dart' as _i871;
import '../ApiManager/module.dart' as _i191;
import '../data/dataSource/remote_datasource.dart' as _i132;
import '../data/repo/repoIMPL.dart' as _i796;
import '../domain/repo.dart' as _i218;
import '../UseCase/LoginUseCase.dart' as _i997;
import '../view/LogIn/viewModel/Logincubit.dart' as _i1004;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.singleton<_i528.PrettyDioLogger>(() => apiModule.prettyDioLogger());
    gh.singleton<_i361.Dio>(
      () => apiModule.provideDio(gh<_i528.PrettyDioLogger>()),
    );
    gh.factory<_i699.ApiService>(() => _i699.ApiService(gh<_i361.Dio>()));
    gh.factory<_i132.LoginRemoteDataSource>(
      () => _i871.LoginRemoteDataSourceIMPL(apiService: gh<_i699.ApiService>()),
    );
    gh.factory<_i218.LoginRepo>(
      () => _i796.LoginRepoIMPL(
        loginRemoteDataSource: gh<_i132.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i997.LoginUseCase>(
      () => _i997.LoginUseCase(loginRepo: gh<_i218.LoginRepo>()),
    );
    gh.factory<_i1004.LoginCubit>(
      () => _i1004.LoginCubit(gh<_i997.LoginUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i191.ApiModule {}
