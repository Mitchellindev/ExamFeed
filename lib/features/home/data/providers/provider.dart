import 'package:dio/dio.dart';
import 'package:exam_feed/core/network/dio_client.dart';
import 'package:exam_feed/core/network/api_endpoint.dart';
import 'package:exam_feed/features/auth/data/models/auth_user.dart';
import 'package:exam_feed/features/auth/data/providers/local_provider.dart';

class ExamBodyProvider extends DioClient {
  Future<Map<String, dynamic>> getExamBody() async {
    final AuthUser? user = await AuthUserLocalDataSourceImpl().getUser();

    try {
      final response = await http.get(
        ApiRoutes.examBody,
        options: Options(
          headers: {"Authorization": "Bearer ${user?.accessToken ?? ""}"},
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
