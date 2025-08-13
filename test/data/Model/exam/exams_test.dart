import 'package:examapp/api/model/exams/exams.dart';
import 'package:examapp/data/Model/exam/exams.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('verify null value', () {

    ExamsDto examsDto=ExamsDto(
      active: null,
      createdAt: null,
      duration: null,
      Id: null,
      numberOfQuestions: null,
      subject: null,
      title: null,
    );
    Exams result=examsDto.toExams();
    expect(result.subject, isNull);
    expect(result.active, isNull);
    expect(result.numberOfQuestions, isNull);
    expect(result.createdAt, isNull);
    expect(result.duration, isNull);
    expect(result.title, isNull);
    expect(result.Id, isNull);
  });
  test ('toExams returns correct values when ExamsDto has data ', (){
    ExamsDto examsDto=ExamsDto(
      active: true,
      createdAt: "12",
      duration: 12,
      Id:"123",
      numberOfQuestions: 12,
      subject: "213",
      title: "2312",
    );
    Exams result=examsDto.toExams();
    expect(result.subject, equals(examsDto.subject));
    expect(result.active, equals(examsDto.active));
    expect(result.numberOfQuestions, equals(examsDto.numberOfQuestions));
    expect(result.createdAt, equals(examsDto.createdAt));
    expect(result.duration, equals(examsDto.duration));
    expect(result.title, equals(examsDto.title));
    expect(result.Id, equals(examsDto.Id));



  });

}