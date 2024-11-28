import 'package:exam_feed/features/home/data/models/exam_body_error.dart';
import 'package:exam_feed/features/home/data/models/exam_body_model.dart';
import 'package:exam_feed/features/home/data/models/subject.dart';

abstract class ExamBodyState {}

class ExamBodyStateIsLoading extends ExamBodyState {}

class ExamBodyStateIsLoaded extends ExamBodyState {
  final ExamBodyModel examBodies;

  ExamBodyStateIsLoaded({required this.examBodies});
}

class SubjectsLoaded extends ExamBodyState {
  final List<Subject> subjects;
  final String examBodyName;

  SubjectsLoaded(this.subjects, this.examBodyName);
}

class ExamBodyStateError extends ExamBodyState {
  final ExamBodyError errorMessage;

  ExamBodyStateError({required this.errorMessage});
}
