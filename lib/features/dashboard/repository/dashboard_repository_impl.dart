import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/models/exambody.dart';
import 'package:exam_feed/core/models/exambody_questions.dart';
import 'package:exam_feed/core/models/questions.dart';
import 'package:exam_feed/features/dashboard/repository/dashboard_repository.dart';

final class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;

  @override
  Future<ApiResponse<ExamBodyModel>> examBody() {
    return _apiHandler.request(
      path: 'question/exambody',
      method: MethodType.get,
      responseMapper: ExamBodyModel.fromJson,
    );
  }

  @override
  Future<ApiResponse<ExamBodyQuestionsModel>> examBodyQuestions({
    required String id,
  }) {
    return _apiHandler.request(
      path: 'question/exambody/$id',
      method: MethodType.get,
      responseMapper: ExamBodyQuestionsModel.fromJson,
    );
  }

  @override
  Future<ApiResponse<QuestionsModel>> getQuestions({
    required String examBody,
    required String subjectId,
    required String year,
  }) {
    return _apiHandler.request(
      path: 'question/get-questions/$examBody/$subjectId',
      method: MethodType.get,
      queryParameters: {'exam_year': year},
      responseMapper: QuestionsModel.fromJson,
    );
  }
}
