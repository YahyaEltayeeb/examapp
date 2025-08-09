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
import '../../api/dataSource/exam/get_exam_by_sub_dataSourceImpl.dart' as _i869;
import '../../api/dataSource/exam_result_local_data_source_imp.dart' as _i793;
import '../../api/dataSource/forget_password_data_source_imp.dart' as _i138;
import '../../api/dataSource/profile/edit_profile_data_source_imp.dart'
    as _i1030;
import '../../api/dataSource/get_all_exams_data_source_imp.dart' as _i594;
import '../../api/dataSource/get_exams_by_id_data_source_imp.dart' as _i32;
import '../../api/dataSource/get_questions_by_exam_id_imp.dart' as _i478;
import '../../api/dataSource/get_subject_data_source_imp.dart' as _i210;
import '../../api/dataSource/reset_password_data_source_imp.dart' as _i465;
import '../../api/dataSource/sign_in_data_source_imp.dart' as _i872;
import '../../api/dataSource/sign_up_data_source_Imp.dart' as _i868;
import '../../api/dataSource/token_local_data_source_imp.dart' as _i903;
import '../../api/dataSource/verify_code_data_source_imp.dart' as _i560;
import '../../data/data_source/exam/get_exam_sub_datasource.dart' as _i318;
import '../../api/interceptor/auth_interceptor.dart' as _i409;
import '../../data/data_source/exam_result_local_data_source.dart' as _i212;
import '../../data/data_source/forget_password_data_source.dart' as _i185;
import '../../data/data_source/profile/edit_profile_data_source.dart' as _i1005;
import '../../data/data_source/get_all_exams_data_source.dart' as _i613;
import '../../data/data_source/get_exams_by_id_data_source.dart' as _i608;
import '../../data/data_source/get_question_by_exam_id_data_source.dart'
    as _i242;
import '../../data/data_source/get_subjects_data_source.dart' as _i888;
import '../../data/data_source/reset_password_data_source.dart' as _i1052;
import '../../data/data_source/sign_in_data_source.dart' as _i982;
import '../../data/data_source/sign_up_data_source.dart' as _i383;
import '../../data/data_source/token_local_data_source.dart' as _i505;
import '../../data/data_source/verify_code_data_source.dart' as _i385;
import '../../data/repos/exam/get_exam_by_sub_repoImpl.dart' as _i1061;
import '../../data/repos/exam_result_local_repo_imp.dart' as _i80;
import '../../data/repos/forget_password_repo_imp.dart' as _i391;
import '../../data/repos/profile/edit_profile_repo_imp.dart' as _i178;
import '../../data/repos/get_all_exam_repo_imp.dart' as _i408;
import '../../data/repos/get_exams_by_id_repo_imp.dart' as _i327;
import '../../data/repos/get_question_by_exam_id_repo_imp.dart' as _i64;
import '../../data/repos/get_subject_repo_imp.dart' as _i393;
import '../../data/repos/reset_password_repo_imp.dart' as _i945;
import '../../data/repos/sign_in_repo_imp.dart' as _i513;
import '../../data/repos/sign_up_repo_Imp.dart' as _i1013;
import '../../data/repos/verify_code_repo_imp.dart' as _i626;
import '../../domain/repo.dart' as _i732;
import '../../domain/repos/exam/exam_by_sub_repo.dart' as _i928;
import '../../domain/repos/exam_result_local_repo.dart' as _i788;
import '../../domain/repos/forget_password_repo.dart' as _i333;
import '../../domain/repos/profile/edit_profile_repo.dart' as _i595;
import '../../domain/repos/get_all_exams_repo.dart' as _i693;
import '../../domain/repos/get_exams_by_id_repo.dart' as _i490;
import '../../domain/repos/get_question_by_exam_id_repo.dart' as _i461;
import '../../domain/repos/get_subject_repo.dart' as _i368;
import '../../domain/repos/reset_password_repo.dart' as _i846;
import '../../domain/repos/sign_up_repo.dart' as _i274;
import '../../domain/repos/verify_code_repo.dart' as _i1011;
import '../../domain/useCase/edit_profile_use_case.dart' as _i235;
import '../../domain/useCase/exam/exam_by_sub_usecase.dart' as _i665;
import '../../domain/useCase/forget_password_use_case.dart' as _i749;
import '../../domain/useCase/get_all_exams_use_case.dart' as _i877;
import '../../domain/useCase/get_exam_result_use_case.dart' as _i234;
import '../../domain/useCase/get_exams_by_id_use_case.dart' as _i114;
import '../../domain/useCase/get_question_use_case.dart' as _i572;
import '../../domain/useCase/get_subject_use_case.dart' as _i91;
import '../../domain/useCase/LoginUseCase.dart' as _i55;
import '../../domain/useCase/reset_password_use_case.dart' as _i1;
import '../../domain/useCase/save_exam_result_use_case.dart' as _i1060;
import '../../domain/useCase/sign_up_use_case.dart' as _i276;
import '../../domain/useCase/verify_code_use_case.dart' as _i869;
import '../../view_model/exams_by_id_cubit/exam_by_id_bloc.dart' as _i731;
import '../../UseCase/LoginUseCase.dart' as _i1070;
import '../../view_model/edit_profile_cubit/edit_profile_cubit.dart' as _i933;
import '../../view_model/exam/exam_by_sub_cubit.dart' as _i488;
import '../../view_model/forget_password_cubit/forget_password_cubit.dart'
    as _i112;
import '../../view_model/get_result_bloc/get_result_bloc.dart' as _i659;
import '../../view_model/home_cubit/home_bloc.dart' as _i1060;
import '../../view_model/question_cubit/question_bloc.dart' as _i345;
import '../../view_model/reset_password_cubit/reset_password_cubit.dart'
    as _i399;
import '../../view_model/save_result_bloc/save_result_bloc.dart' as _i599;
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
    gh.factory<_i505.TokenLocalDataSource>(
      () => _i903.TokenLocalDataSourceImp(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i212.ExamResultLocalDataSource>(
      () => _i793.ExamResultLocalDataSourceImp(),
    );
    gh.factory<_i409.AuthInterceptor>(
      () => _i409.AuthInterceptor(gh<_i505.TokenLocalDataSource>()),
    );
    gh.singleton<_i361.Dio>(
      () => apiModule.dioProvider(gh<_i409.AuthInterceptor>()),
    );
    gh.factory<_i234.GetExamResultsUseCase>(
      () => _i234.GetExamResultsUseCase(gh<_i212.ExamResultLocalDataSource>()),
    );
    gh.factory<_i788.ExamResultLocalRepo>(
      () => _i80.ExamResultLocalRepoImp(gh<_i212.ExamResultLocalDataSource>()),
    );
    gh.factory<_i1060.SaveExamResultUseCase>(
      () => _i1060.SaveExamResultUseCase(gh<_i788.ExamResultLocalRepo>()),
    );
    gh.factory<_i659.GetExamResultBloc>(
      () => _i659.GetExamResultBloc(gh<_i234.GetExamResultsUseCase>()),
    );
    gh.singleton<_i361.Dio>(
      () => apiModule.dioProvider(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i578.ApiServices>(() => _i578.ApiServices(gh<_i361.Dio>()));
    gh.factory<_i982.LoginRemoteDataSource>(
      () =>
          _i872.LoginRemoteDataSourceIMPL(apiService: gh<_i578.ApiServices>()),
    );
    gh.factory<_i385.VerifyCodeDataSource>(
      () => _i560.VerifyCodeDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i608.GetExamsByIdDataSource>(
      () => _i32.GetExamsByIdDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i383.SignUpDataSource>(
      () => _i868.SignUpDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i185.ForgetPasswordDataSource>(
      () => _i138.ForgetPasswordDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i928.ExamBySubRepo>(
      () => _i1061.ExamBySubRepoImpl(apiServices: gh<_i578.ApiServices>()),
    );
    gh.factory<_i318.ExamBySubDataSource>(
      () => _i869.ExamBySubDataSourceImpl(apiServices: gh<_i578.ApiServices>()),
    );
    gh.factory<_i665.ExamBySubUseCase>(
      () => _i665.ExamBySubUseCase(examBySubRepo: gh<_i928.ExamBySubRepo>()),
    );
    gh.factory<_i242.GetQuestionByExamIdDataSource>(
      () => _i478.GetQuestionsByExamIdImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i888.GetSubjectsDataSource>(
      () => _i210.GetSubjectDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i461.GetQuestionByExamIdRepo>(
      () => _i64.GetQuestionByExamIdRepoImp(
        gh<_i242.GetQuestionByExamIdDataSource>(),
      ),
    );
    gh.factory<_i613.GetAllExamsDataSource>(
      () => _i594.GetAllExamsDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i274.SignUpRepo>(
      () => _i1013.SignUpRepoImp(
        gh<_i383.SignUpDataSource>(),
        gh<_i505.TokenLocalDataSource>(),
      ),
    );
    gh.factory<_i1005.EditProfileDataSource>(
      () => _i1030.EditProfileDataSourceImpl(
        gh<_i578.ApiServices>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i333.ForgetPasswordRepo>(
      () => _i391.ForgetPasswordRepoImp(gh<_i185.ForgetPasswordDataSource>()),
    );
    gh.factory<_i1052.ResetPasswordDataSource>(
      () => _i465.ResetPasswordDataSourceImp(gh<_i578.ApiServices>()),
    );
    gh.factory<_i599.SaveExamBloc>(
      () => _i599.SaveExamBloc(gh<_i1060.SaveExamResultUseCase>()),
    );
    gh.factory<_i488.ExamBySubViewModel>(
      () => _i488.ExamBySubViewModel(
        examBySubUseCase: gh<_i665.ExamBySubUseCase>(),
      ),
    );
    gh.factory<_i846.ResetPasswordRepo>(
      () => _i945.ResetPasswordRepoImp(gh<_i1052.ResetPasswordDataSource>()),
    );
    gh.factory<_i1.ResetPasswordUseCase>(
      () => _i1.ResetPasswordUseCase(gh<_i846.ResetPasswordRepo>()),
    );
    gh.factory<_i572.GetQuestionUseCase>(
      () => _i572.GetQuestionUseCase(gh<_i461.GetQuestionByExamIdRepo>()),
    );
    gh.factory<_i490.GetExamsByIdRepo>(
      () => _i327.GetExamsByIdRepoImp(gh<_i608.GetExamsByIdDataSource>()),
    );
    gh.factory<_i399.ResetPasswordCubit>(
      () => _i399.ResetPasswordCubit(gh<_i1.ResetPasswordUseCase>()),
    );
    gh.factory<_i1011.VerifyCodeRepo>(
      () => _i626.VerifyCodeRepoImp(gh<_i385.VerifyCodeDataSource>()),
    );
    gh.factory<_i693.GetAllExamsRepo>(
      () => _i408.GetAllExamRepoImp(gh<_i613.GetAllExamsDataSource>()),
    );
    gh.factory<_i114.GetExamsByIdUseCase>(
      () => _i114.GetExamsByIdUseCase(gh<_i490.GetExamsByIdRepo>()),
    );
    gh.factory<_i749.ForgetPasswordUseCase>(
      () => _i749.ForgetPasswordUseCase(gh<_i333.ForgetPasswordRepo>()),
    );
    gh.factory<_i732.LoginRepo>(
      () => _i513.LoginRepoIMPL(
        gh<_i982.LoginRemoteDataSource>(),
        gh<_i505.TokenLocalDataSource>(),
      ),
    );
    gh.factory<_i276.SignUpUseCase>(
      () => _i276.SignUpUseCase(gh<_i274.SignUpRepo>()),
    );
    gh.factory<_i595.EditProfileRepo>(
      () => _i178.EditProfileRepoImpl(gh<_i1005.EditProfileDataSource>()),
    );
    gh.factory<_i1070.LoginUseCase>(
      () => _i1070.LoginUseCase(loginRepo: gh<_i732.LoginRepo>()),
    gh.factory<_i55.LoginUseCase>(
      () => _i55.LoginUseCase(loginRepo: gh<_i732.LoginRepo>()),
    );
    gh.factory<_i636.SignUpCubit>(
      () => _i636.SignUpCubit(gh<_i276.SignUpUseCase>()),
    );
    gh.factory<_i345.GetQuestionBloc>(
      () => _i345.GetQuestionBloc(gh<_i572.GetQuestionUseCase>()),
    );
    gh.factory<_i368.GetSubjectRepo>(
      () => _i393.GetSubjectRepoImp(gh<_i888.GetSubjectsDataSource>()),
    );
    gh.factory<_i731.ExamByIdBloc>(
      () => _i731.ExamByIdBloc(gh<_i114.GetExamsByIdUseCase>()),
    );
    gh.factory<_i91.GetSubjectUseCase>(
      () => _i91.GetSubjectUseCase(gh<_i368.GetSubjectRepo>()),
    );
    gh.factory<_i112.ForgetPasswordCubit>(
      () => _i112.ForgetPasswordCubit(gh<_i749.ForgetPasswordUseCase>()),
    );
    gh.factory<_i936.LoginCubit>(
      () => _i936.LoginCubit(gh<_i55.LoginUseCase>()),
    );
    gh.factory<_i877.GetAllExamsUseCase>(
      () => _i877.GetAllExamsUseCase(gh<_i693.GetAllExamsRepo>()),
    );
    gh.factory<_i869.VerifyCodeUseCase>(
      () => _i869.VerifyCodeUseCase(gh<_i1011.VerifyCodeRepo>()),
    );
    gh.factory<_i1060.HomeBloc>(
      () => _i1060.HomeBloc(gh<_i91.GetSubjectUseCase>()),
    );
    gh.factory<_i235.EditProfileUseCase>(
      () => _i235.EditProfileUseCase(gh<_i595.EditProfileRepo>()),
    );
    gh.factory<_i503.VerifyCodeCubit>(
      () => _i503.VerifyCodeCubit(gh<_i869.VerifyCodeUseCase>()),
    );
    gh.factory<_i933.EditProfileCubit>(
      () => _i933.EditProfileCubit(
        editProfileUseCase: gh<_i235.EditProfileUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPrefModule extends _i451.SharedPrefModule {}

class _$ApiModule extends _i676.ApiModule {}
