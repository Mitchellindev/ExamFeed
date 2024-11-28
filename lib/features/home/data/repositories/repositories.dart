import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_feed/core/network/dio_exception.dart';
import 'package:exam_feed/core/utils/typedef.dart';
import 'package:exam_feed/features/home/data/models/exam_body_error.dart';
import 'package:exam_feed/features/home/data/models/exam_body_model.dart';
import 'package:exam_feed/features/home/data/providers/provider.dart';

class ExamBodyRepository {
  final ExamBodyProvider examBodyProvider;

  ExamBodyRepository({
    required this.examBodyProvider,
  });

  Future<EitherFetchExamBodyOrError> getExamBodies() async {
    try {
      final response = await examBodyProvider.getExamBody();
      return right(ExamBodyModel.fromJson(response));
      // if (response. == 200) {
      //   final examBodies = (response.data['examBody'] as List)
      //       .map((e) => ExamBody.fromJson(e))
      //       .toList();
      //   return examBodies;
      // } else {
      //   throw Exception('Failed to load exam bodies');
      // }
    } on DioException catch (e) {
      return left(
        ExamBodyError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      throw ExamBodyError(errorMessage: e.toString());
    }
  }

  // Future<List<Subject>> fetchSubjectsByExamBody(String examBodyId) async {
  //   try {
  //     final response = await _dio
  //         .get('https://mobile-backend-5837.onrender.com/question/subjects');
  //     if (response.statusCode == 200) {
  //       final subjects = (response.data['subjects'] as List)
  //           .where((e) => (e['exam_body'] as List).contains(examBodyId))
  //           .map((e) => Subject.fromJson(e))
  //           .toList();
  //       return subjects;
  //     } else {
  //       throw Exception('Failed to load subjects');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching subjects: $e');
  //   }
  // }
}
