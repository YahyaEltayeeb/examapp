import 'package:examapp/api/dataSource/exam/get_exam_by_sub_dataSourceImpl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../api_service_test.mocks.dart';

void main() {
  test('TODO: Implement tests for get_exam_by_sub_dataSourceImpl.dart', () {

    MockApiServices mockApiServices =MockApiServices();
    ExamBySubDataSourceImpl examBySubDataSourceImpl = ExamBySubDataSourceImpl(apiServices: mockApiServices);
  });
}