import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/models/exambody.dart';
import 'package:exam_feed/core/models/exambody_questions.dart';
import 'package:exam_feed/core/models/questions.dart';

abstract class DashboardRepository {
  Future<ApiResponse<ExamBodyModel>> examBody();
  Future<ApiResponse<ExamBodyQuestionsModel>> examBodyQuestions({
    required String id,
  });
  Future<ApiResponse<QuestionsModel>> getQuestions({
    required String examBody,
    required String subjectId,
    required String year,
  });
}
