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
import '../../api/dataSource/forget_password_data_source_imp.dart' as _i138;
import '../../api/dataSource/reset_password_data_source_imp.dart' as _i465;
import '../../api/dataSource/sign_up_data_source_Imp.dart' as _i868;
import '../../api/dataSource/token_local_data_source_imp.dart' as _i903;
import '../../api/dataSource/verify_code_data_source_imp.dart' as _i560;
import '../../data/data_source/forget_password_data_source.dart' as _i185;
import '../../data/data_source/reset_password_data_source.dart' as _i1052;
import '../../data/data_source/sign_in_data_source.dart' as _i982;
import '../../data/data_source/sign_up_data_source.dart' as _i383;
import '../../data/data_source/token_local_data_source.dart' as _i505;
import '../../data/data_source/verify_code_data_source.dart' as _i385;
import '../../data/repos/forget_password_repo_imp.dart' as _i391;
import '../../data/repos/reset_password_repo_imp.dart' as _i945;
import '../../data/repos/sign_in_repo_imp.dart' as _i513;
import '../../data/repos/sign_up_repo_Imp.dart' as _i1013;
import '../../data/repos/verify_code_repo_imp.dart' as _i626;
import '../../domain/repo.dart' as _i732;
import '../../domain/repos/forget_password_repo.dart' as _i333;
import '../../domain/repos/reset_password_repo.dart' as _i846;
import '../../domain/repos/sign_up_repo.dart' as _i274;
import '../../domain/repos/verify_code_repo.dart' as _i1011;
import '../../domain/useCase/forget_password_use_case.dart' as _i749;
import '../../domain/useCase/reset_password_use_case.dart' as _i1;
import '../../domain/useCase/sign_up_use_case.dart' as _i276;
import '../../domain/useCase/verify_code_use_case.dart' as _i869;
import '../../UseCase/LoginUseCase.dart' as _i1070;
import '../../view_model/forget_password_cubit/forget_password_cubit.dart'
    as _i112;
import '../../view_model/reset_password_cubit/reset_password_cubit.dart'
    as _i399;
import '../../view_model/sign_in_cubit/Logincubit.dart' as _i936;
import '../../view_model/sign_up_cubit/sign_up_cubit.dart' as _i636;
import '../../view_model/verify_code_cubit/verify_code_cubit.dart' as _i503;
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
    gh.factory<_i385.VerifyCodeDataSource>(
      () => _i560.VerifyCodeDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i732.LoginRepo>(
      () => _i513.LoginRepoIMPL(
        loginRemoteDataSource: gh<_i982.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i383.SignUpDataSource>(
      () => _i868.SignUpDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i185.ForgetPasswordDataSource>(
      () => _i138.ForgetPasswordDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i274.SignUpRepo>(
      () => _i1013.SignUpRepoImp(
        gh<_i383.SignUpDataSource>(),
        gh<_i505.TokenLocalDataSource>(),
      ),
    );
    gh.factory<_i333.ForgetPasswordRepo>(
      () => _i391.ForgetPasswordRepoImp(gh<_i185.ForgetPasswordDataSource>()),
    );
    gh.factory<_i1052.ResetPasswordDataSource>(
      () => _i465.ResetPasswordDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i846.ResetPasswordRepo>(
      () => _i945.ResetPasswordRepoImp(gh<_i1052.ResetPasswordDataSource>()),
    );
    gh.factory<_i1.ResetPasswordUseCase>(
      () => _i1.ResetPasswordUseCase(gh<_i846.ResetPasswordRepo>()),
    );
    gh.factory<_i399.ResetPasswordCubit>(
      () => _i399.ResetPasswordCubit(gh<_i1.ResetPasswordUseCase>()),
    );
    gh.factory<_i1011.VerifyCodeRepo>(
      () => _i626.VerifyCodeRepoImp(gh<_i385.VerifyCodeDataSource>()),
    );
    gh.factory<_i749.ForgetPasswordUseCase>(
      () => _i749.ForgetPasswordUseCase(gh<_i333.ForgetPasswordRepo>()),
    );
    gh.factory<_i276.SignUpUseCase>(
      () => _i276.SignUpUseCase(gh<_i274.SignUpRepo>()),
    );
    gh.factory<_i1070.LoginUseCase>(
      () => _i1070.LoginUseCase(loginRepo: gh<_i732.LoginRepo>()),
    );
    gh.factory<_i636.SignUpCubit>(
      () => _i636.SignUpCubit(gh<_i276.SignUpUseCase>()),
    );
    gh.factory<_i112.ForgetPasswordCubit>(
      () => _i112.ForgetPasswordCubit(gh<_i749.ForgetPasswordUseCase>()),
    );
    gh.factory<_i869.VerifyCodeUseCase>(
      () => _i869.VerifyCodeUseCase(gh<_i1011.VerifyCodeRepo>()),
    );
    gh.factory<_i936.LoginCubit>(
      () => _i936.LoginCubit(gh<_i1070.LoginUseCase>()),
    );
    gh.factory<_i503.VerifyCodeCubit>(
      () => _i503.VerifyCodeCubit(gh<_i869.VerifyCodeUseCase>()),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i451.SharedPrefModule {}

class _$ApiModule extends _i676.ApiModule {}
