import 'package:examapp/api/model/response/exam_model_by_id_dto.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/get_exams_by_id_data_source.dart';
import 'package:examapp/data/repos/get_exams_by_id_repo_imp.dart';
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_exams_by_id_repo_imp_test.mocks.dart';

@GenerateMocks([GetExamsByIdDataSource])
void main() {
  test(
    'verify call examById is should call examById from DataSource',
    () async {
      //arrange
      MockGetExamsByIdDataSource mockGetExamsByIdDataSource =
          MockGetExamsByIdDataSource();
      GetExamsByIdRepoImp getExamsByIdRepoImp = GetExamsByIdRepoImp(
        mockGetExamsByIdDataSource,
      );
      var examDto = [
        ExamModelByIdDto(
          id: '123',
          title: 'css',
          duration: 4,
          subject: 'css',
          numberOfQuestions: 5,
        ),
        ExamModelByIdDto(
          id: '345',
          title: 'html',
          duration: 4,
          subject: 'html',
          numberOfQuestions: 5,
        ),
      ];
      var expectedexamById = [
        ExamModelById(
          id: '123',
          title: 'css',
          duration: 4,
          subject: 'css',
          numberOfQuestions: 5,
        ),
        ExamModelById(
          id: '345',
          title: 'html',
          duration: 4,
          subject: 'html',
          numberOfQuestions: 5,
        ),
      ];

      var expectedResuilt = ApiSuccessResult(expectedexamById);
      provideDummy<ApiResult<List<ExamModelById>>>(expectedResuilt);

      when(
        mockGetExamsByIdDataSource.getExamsByid(''),
      ).thenAnswer((_) async => examDto);

      //act
      var responce = await getExamsByIdRepoImp.getExamsById('');

      //assert
      verify(mockGetExamsByIdDataSource.getExamsByid('')).called(1);
      expect(responce, expectedResuilt);
    },
  );
}
