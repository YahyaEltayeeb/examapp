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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../api/api_service.dart' as _i578;
import '../../api/dataSource/sign_up_data_source_Imp.dart' as _i868;
import '../../api/dataSource/token_local_data_source_imp.dart' as _i903;
import '../../data/data_source/sign_up_data_source.dart' as _i383;
import '../../data/data_source/token_local_data_source.dart' as _i505;
import '../../data/repos/sign_up_repo_Imp.dart' as _i1013;
import '../../domain/repos/sign_up_repo.dart' as _i274;
import '../../domain/useCase/sign_up_use_case.dart' as _i276;
import '../../view_model/sign_up_cubit.dart' as _i261;
import 'Api_module.dart' as _i676;
import 'shared_pref_module.dart' as _i451;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefModule = _$SharedPrefModule();
    final apiModule = _$ApiModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPrefModule.provideSharedPreference(),
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => apiModule.dioProvider());
    gh.factory<_i505.TokenLocalDataSource>(
      () => _i903.TokenLocalDataSourceImp(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i578.ApiServices>(() => _i578.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i383.SignUpDataSource>(
      () => _i868.SignUpDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i274.SignUpRepo>(
      () => _i1013.SignUpRepoImp(
        gh<_i383.SignUpDataSource>(),
        gh<_i505.TokenLocalDataSource>(),
      ),
    );
    gh.factory<_i276.SignUpUseCase>(
      () => _i276.SignUpUseCase(gh<_i274.SignUpRepo>()),
    );
    gh.factory<_i261.SignUpCubit>(
      () => _i261.SignUpCubit(gh<_i276.SignUpUseCase>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i451.SharedPrefModule {}

class _$ApiModule extends _i676.ApiModule {}
