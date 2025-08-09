// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:examapp/api/api_module/api_result.dart';
// import 'package:examapp/api/api_service.dart';
// import 'package:injectable/injectable.dart';
// import '../../../data/data_source/exam/get_exam_sub_datasource.dart';
// import '../../model/exams/exam_by_sub.dart';
//
// @Injectable(as: ExamBySubDataSource)
// class ExamBySubDataSourceImpl extends ExamBySubDataSource {
//   ApiServices apiServices;
//   ExamBySubDataSourceImpl({required this.apiServices});
//
//   @override
//   Future<ApiResult<ExamBySub>> getExam(String subject, int page, int limit) async {
//     try {
//       final connectivityResult = await Connectivity().checkConnectivity();
//       if (connectivityResult == ConnectivityResult.wifi ||
//           connectivityResult == ConnectivityResult.mobile) {
//         final response = await apiServices.getExamsBySubject(
//           subject: subject,
//           page: page,
//           limit: limit,
//         );
//         final examBySub = response.toExamBySub();
//         return ApiSuccessResult(data: examBySub);
//       } else {
//         return ApiErrorResult(
//           errorMessage: 'No internet connection',
//           errorCode: null,
//         );
//       }
//     } catch (e) {
//       return ApiErrorResult(errorMessage: e.toString(), errorCode: getErrorCode(e));
//     }
//   }
//
//   int? getErrorCode(dynamic error) {
//     if (error.toString().contains('404')) return 404;
//     if (error.toString().contains('401')) return 401;
//     if (error.toString().contains('500')) return 500;
//     if (error.toString().contains('timeout')) return 408;
//     return null;
//   }
// }
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:examapp/api/api_module/api_result.dart';
// import 'package:examapp/api/api_service.dart';
// import 'package:injectable/injectable.dart';
// import '../../../data/data_source/exam/get_exam_sub_datasource.dart';
// import '../../model/exams/exam_by_sub.dart';
//
// @Injectable(as: ExamBySubDataSource)
// class ExamBySubDataSourceImpl extends ExamBySubDataSource {
//   ApiServices apiServices;
//   ExamBySubDataSourceImpl({required this.apiServices});
//
//   @override
//   Future<ApiResult<ExamBySub>> getExam(String subject, int page, int limit) async {
//     try {
//       final connectivityResult = await Connectivity().checkConnectivity();
//       if (connectivityResult == ConnectivityResult.wifi ||
//           connectivityResult == ConnectivityResult.mobile) {
//         final response = await apiServices.getExamsBySubject(
//           subject=subject,
//             page=page,
//             limit=limit
//         );
//         final examBySub = response.toExamBySub();
//         return ApiSuccessResult(data: examBySub);
//       } else {
//         return ApiErrorResult(
//           errorMessage: 'No internet connection',
//           errorCode: null,
//         );
//       }
//     } catch (e) {
//       return ApiErrorResult(errorMessage: e.toString(), errorCode: getErrorCode(e));
//     }
//   }
//
//   int? getErrorCode(dynamic error) {
//     if (error.toString().contains('404')) return 404;
//     if (error.toString().contains('401')) return 401;
//     if (error.toString().contains('500')) return 500;
//     if (error.toString().contains('timeout')) return 408;
//     return null;
//   }
// }
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/api/api_service.dart';
import 'package:injectable/injectable.dart';
import '../../../data/data_source/exam/get_exam_sub_datasource.dart';
import '../../model/exams/exam_by_sub.dart';

@Injectable(as: ExamBySubDataSource)
class ExamBySubDataSourceImpl extends ExamBySubDataSource {
  ApiServices apiServices;
  ExamBySubDataSourceImpl({required this.apiServices});

  @override
  Future<ApiResult<ExamBySub>> getExam(String subject, int page, int limit) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        final response = await apiServices.getExamsBySubject(
          subject,
          page,
          limit,
        );
        final examBySub = response.toExamBySub();
        return ApiSuccessResult(data: examBySub);
      } else {
        return ApiErrorResult(
          errorMessage: 'No internet connection',
          errorCode: null,
        );
      }
    } catch (e) {
      return ApiErrorResult(errorMessage: e.toString(), errorCode: getErrorCode(e));
    }
  }

  int? getErrorCode(dynamic error) {
    if (error.toString().contains('404')) return 404;
    if (error.toString().contains('401')) return 401;
    if (error.toString().contains('500')) return 500;
    if (error.toString().contains('timeout')) return 408;
    return null;
  }
}
