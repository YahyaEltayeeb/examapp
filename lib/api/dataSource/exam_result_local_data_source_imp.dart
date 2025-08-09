import 'dart:convert';

import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/data/Model/exam_result_model.dart';
import 'package:examapp/data/data_source/exam_result_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: ExamResultLocalDataSource)
@LazySingleton(as: ExamResultLocalDataSource)
class ExamResultLocalDataSourceImp implements ExamResultLocalDataSource {
  final _key = ArgumentsValue.examResult;
  @override
  Future<List<ExamResultModel>> getAllExamResult() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return [];

    final Map<String, dynamic> examsMap = jsonDecode(data);
    return examsMap.values.map((e) => ExamResultModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveExamResult(ExamResultModel exam) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    Map<String, dynamic> examsMap = data != null ? jsonDecode(data) : {};

    examsMap[exam.examId] = exam.toJson();
    await prefs.setString(_key, jsonEncode(examsMap));
  }
}
