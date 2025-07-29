import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';
import 'package:examapp/domain/repos/get_exams_by_id_repo.dart';
import 'package:examapp/domain/useCase/get_exams_by_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_exams_by_id_use_case_test.mocks.dart';

@GenerateMocks([GetExamsByIdRepo])
void main() {
  test(
    'verify when call examsByIdUseCase is should call examById from repo ',
    ()async {
      MockGetExamsByIdRepo mockGetExamsByIdRepo = MockGetExamsByIdRepo();
      GetExamsByIdUseCase useCase = GetExamsByIdUseCase(mockGetExamsByIdRepo);
      var expectedExamxs = [
        ExamModelById(
          title: 'css',
          subject: 'css',
          duration: 4,
          numberOfQuestions: 4,
          id: '',
        ),
        ExamModelById(
          title: 'html',
          subject: 'html',
          duration: 5,
          numberOfQuestions: 5,
          id: '',
        ),
      ];
      var expectedResuilt = ApiSuccessResult(expectedExamxs);
      provideDummy<ApiResult<List<ExamModelById>>>(expectedResuilt);

      when(
        mockGetExamsByIdRepo.getExamsById(''),
      ).thenAnswer((_) async => expectedResuilt);

      //act 
      var responce=await useCase.call('');

      //assert
      verify(mockGetExamsByIdRepo.getExamsById('')).called(1);
      responce as ApiSuccessResult<List<ExamModelById>>;
      expect(responce.data, expectedExamxs);
    },
  );
}
