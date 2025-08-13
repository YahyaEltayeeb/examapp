import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/dataSource/exam/get_exam_by_sub_dataSourceImpl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'api_service_test.mocks.dart';


@GenerateMocks([ApiServices])
void main() {
  test('call verification with correct parameters', () {
    MockApiServices mockApiServices =MockApiServices();
    ExamBySubDataSourceImpl examBySubDataSourceImpl = ExamBySubDataSourceImpl(apiServices: mockApiServices);
    
  });
}