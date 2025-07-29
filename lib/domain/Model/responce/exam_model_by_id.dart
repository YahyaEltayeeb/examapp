// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ExamModelById extends Equatable {
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  const ExamModelById({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
  });

  @override
  List<Object?> get props => [id, title, duration, subject, numberOfQuestions];
}
