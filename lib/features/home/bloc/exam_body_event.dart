abstract class ExamBodyEvent {}

class LoadExamBodyEvent extends ExamBodyEvent {}

class SelectExamBody extends ExamBodyEvent {
  final String examBodyId;

  SelectExamBody({required this.examBodyId});
}
