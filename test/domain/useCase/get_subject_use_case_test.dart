import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/subject_model.dart';
import 'package:examapp/domain/repos/get_subject_repo.dart';
import 'package:examapp/domain/useCase/get_subject_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_subject_use_case_test.mocks.dart';

@GenerateMocks([GetSubjectRepo])
void main() {
  test(
    'verify when call subjectUseCase it should call getSubject from repo',
    () async {
      //arrange
      MockGetSubjectRepo mockGetSubjectRepo = MockGetSubjectRepo();
      GetSubjectUseCase useCase = GetSubjectUseCase(mockGetSubjectRepo);

      var expectedSubject = [
        SubjectModel(id: '123', name: 'html', icon: ''),
        SubjectModel(id: '345', name: 'css', icon: ''),
      ];
      var expectedResuilt = ApiSuccessResult(expectedSubject);
      provideDummy<ApiResult<List<SubjectModel>>>(expectedResuilt);
      when(
        mockGetSubjectRepo.getSubjectRepo(),
      ).thenAnswer((_) async => expectedResuilt);
      //act
      var responce = await useCase.call();

      //assert
      verify(mockGetSubjectRepo.getSubjectRepo()).called(1);
      responce as ApiSuccessResult<List<SubjectModel>>;
      expect(responce.data, equals(expectedSubject));
    },
  );
}
