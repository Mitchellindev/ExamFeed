import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/models/exambody.dart';
import 'package:exam_feed/core/models/exambody_questions.dart';
import 'package:exam_feed/core/models/questions.dart';
import 'package:exam_feed/features/dashboard/repository/dashboard_repository.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  static DashboardProvider? _instance;

  DashboardProvider() {
    _dasboardRepository = locator.get<DashboardRepository>();
  }

  static DashboardProvider get instance {
    _instance ??= DashboardProvider();
    return _instance!;
  }

  late DashboardRepository _dasboardRepository;

  ExamBodyModel? _examBodyModel;
  ExamBodyModel? get examBodyModel => _examBodyModel;

  Future<void> examBody({
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    final response = await _dasboardRepository.examBody();
    response.when(
      success: (data) async {
        _examBodyModel = data?.data ?? ExamBodyModel();

        onSuccess();
        notifyListeners();
      },
      error: (error) {
        onError(error);
      },
    );
  }

  ExamBodyQuestionsModel? _examBodyQuestionsModel;
  ExamBodyQuestionsModel? get examBodyQuestionsModel => _examBodyQuestionsModel;

  Future<void> examBodyQuestions({
    required String id,
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    final response = await _dasboardRepository.examBodyQuestions(id: id);
    response.when(
      success: (data) async {
        _examBodyQuestionsModel = data?.data ?? ExamBodyQuestionsModel();

        onSuccess();
        notifyListeners();
      },
      error: (error) {
        onError(error);
      },
    );
  }

  QuestionsModel? _questionsModel;
  QuestionsModel? get questionsModel => _questionsModel;

  Future<void> getQuestions({
    required String examBody,
    required String subjectId,
    required String year,
    required VoidCallback onSuccess,
    required Function(ApiError val) onError,
  }) async {
    final response = await _dasboardRepository.getQuestions(
        examBody: examBody, subjectId: subjectId, year: year);
    response.when(
      success: (data) async {
        _questionsModel = data?.data ?? QuestionsModel();

        onSuccess();
        notifyListeners();
      },
      error: (error) {
        onError(error);
      },
    );
  }
}
