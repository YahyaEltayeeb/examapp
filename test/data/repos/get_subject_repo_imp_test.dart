import 'package:examapp/api/model/response/subject_model_dto.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/get_subjects_data_source.dart';
import 'package:examapp/data/repos/get_subject_repo_imp.dart';
import 'package:examapp/domain/model/responce/subject_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_subject_repo_imp_test.mocks.dart';

@GenerateMocks([GetSubjectsDataSource])
void main() {
  test(
    'verify when call getSubjectrepo is should getSubject from dataSource',
    () async {
      MockGetSubjectsDataSource mockGetSubjectsDataSource =
          MockGetSubjectsDataSource();

      GetSubjectRepoImp getSubjectRepoImp = GetSubjectRepoImp(
        mockGetSubjectsDataSource,
      );
      var expectedSubject = [
        SubjectModel(id: '123', name: 'html', icon: ''),
        SubjectModel(id: '345', name: 'css', icon: ''),
      ];

      var subjectDto = [
        SubjectModelDto(id: '123', name: 'html', icon: ''),
        SubjectModelDto(id: '345', name: 'css', icon: ''),
      ];
      var expectedResuilt = ApiSuccessResult(expectedSubject);
      provideDummy<ApiResult<List<SubjectModel>>>(expectedResuilt);

      when(
        mockGetSubjectsDataSource.getSubject(),
      ).thenAnswer((_) async => subjectDto);

      //act
      var responce = await getSubjectRepoImp.getSubjectRepo();

      //assert
      verify(mockGetSubjectsDataSource.getSubject()).called(1);
     responce as ApiSuccessResult<List<SubjectModel>>;
      expect(responce.data, equals(expectedSubject));
    },
  );
}
