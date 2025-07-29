import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/dataSource/get_exams_by_id_data_source_imp.dart';
import 'package:examapp/api/model/response/exam_model_by_id_dto.dart';
import 'package:examapp/api/model/response/exam_responce_by_id_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_subject_data_source_imp_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test(
    'verify when call ExamsById is should call ExamsById from api',
    () async {
      //Arrange
      MockApiServices mockApiServices = MockApiServices();
      GetExamsByIdDataSourceImp getExamsByIdDataSourceImp =
          GetExamsByIdDataSourceImp(mockApiServices);
      var actualResuilt = ExamResponseByIdDto(
        exams: [
          ExamModelByIdDto(
            id: '123',
            title: 'css',
            duration: 4,
            subject: 'css',
            numberOfQuestions: 4,
            active: false,
            createdAt: DateTime(DateTime.monday),
          ),
          ExamModelByIdDto(
            id: '222',
            title: 'html',
            duration: 4,
            subject: 'html',
            numberOfQuestions: 4,
            active: false,
            createdAt: DateTime(DateTime.monday),
          ),
        ],
      );
      when(
        mockApiServices.getExamsById(''),
      ).thenAnswer((_) async => actualResuilt);

      //act
      var resuilt = await getExamsByIdDataSourceImp.getExamsByid('');

      //assert
      verify(mockApiServices.getExamsById('')).called(1);
      expect(resuilt, actualResuilt.exams);
    },
  );
}
