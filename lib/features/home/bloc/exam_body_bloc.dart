import 'package:exam_feed/features/home/bloc/exam_body_event.dart';
import 'package:exam_feed/features/home/bloc/exam_body_state.dart';
import 'package:exam_feed/features/home/data/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamBodyBloc extends Bloc<ExamBodyEvent, ExamBodyState> {
  final ExamBodyRepository examBodyRepository;

  ExamBodyBloc({required this.examBodyRepository})
      : super(ExamBodyStateIsLoading()) {
    on<ExamBodyEvent>((event, emit) async {
      emit(ExamBodyStateIsLoading());
      final response = await examBodyRepository.getExamBodies();
      response.fold(
        (l) => emit(ExamBodyStateError(errorMessage: l)),
        (r) => emit(ExamBodyStateIsLoaded(examBodies: r)),
      );
    });
  }
  // Stream<ExamBodyState> mapEventToState(ExamBodyEvent event) async* {
  //   if (event is LoadExamBodies) {
  //     yield ExamBodyLoading();
  //     try {
  //       final examBodies = await examBodyRepository.fetchExamBodies();
  //       yield ExamBodyLoaded(examBodies: examBodies);
  //     } catch (e) {
  //       yield ExamBodyError("Failed to load exam bodies", errorMessage: '');
  //     }
  //   } else if (event is SelectExamBody) {
  //     yield ExamBodyLoading();
  //     try {
  //       final subjects =
  //           await examBodyRepository.fetchSubjectsByExamBody(event.examBodyId);
  //       final examBody = await examBodyRepository.fetchExamBodies();
  //       final examBodyName =
  //           examBody.firstWhere((exam) => exam.id == event.examBodyId).name;
  //       yield SubjectsLoaded(subjects, examBodyName!);
  //     } catch (e) {
  //       yield ExamBodyError(
  //           "Failed to load subjects for the selected exam body",
  //           errorMessage: '');
  //     }
  //   }
  // }
}
