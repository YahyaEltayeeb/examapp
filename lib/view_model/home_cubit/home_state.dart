import 'package:examapp/domain/model/responce/subject_model.dart';

class GetSubjectState {
  bool isLoaddingSubject = false;
  String? messageErrorSubject = '';
  List<SubjectModel>? subjects = const [];
  GetSubjectState({
    this.isLoaddingSubject = false,
    this.messageErrorSubject = '',
    this.subjects = const [],
  });

  GetSubjectState copyWith({
    bool? isLoaddingGetAllExams,
    String? messageErrorSubject,
    List<SubjectModel>? subjects,
  }) {
    return GetSubjectState(
      isLoaddingSubject: isLoaddingGetAllExams ?? isLoaddingSubject,
      subjects: subjects ?? this.subjects,
      messageErrorSubject: messageErrorSubject ?? this.messageErrorSubject,
    );
  }
}
