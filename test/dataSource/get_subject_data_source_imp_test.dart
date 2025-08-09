import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/dataSource/get_subject_data_source_imp.dart';
import 'package:examapp/api/model/response/subject_model_dto.dart';
import 'package:examapp/api/model/response/subject_responce_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_subject_data_source_imp_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test('verufy call getSubject is should getSubject from api', () async {
    //Arrange
    var expectedResuilt = SubjectResponseDto(
      subjects: [
        SubjectModelDto(id: '22', name: 'html', icon: '', createdAt: ''),
        SubjectModelDto(id: '123', name: 'css', icon: '', createdAt: ''),
      ],
    );
    MockApiServices mockApiServices = MockApiServices();
    GetSubjectDataSourceImp getSubjectDataSourceImp = GetSubjectDataSourceImp(
      mockApiServices,
    );

    when(mockApiServices.getSubject()).thenAnswer((_) async => expectedResuilt);

    //Act

    var resuilt = await getSubjectDataSourceImp.getSubject();

    //Assert

    verify(mockApiServices.getSubject()).called(1);

    expect(resuilt, expectedResuilt.subjects);
  });
}
