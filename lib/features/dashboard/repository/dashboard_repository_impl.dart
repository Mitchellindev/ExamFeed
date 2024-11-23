import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/api/pagination.dart';
import 'package:exam_feed/core/models/order.dart';
import 'package:exam_feed/features/dashboard/repository/dashboard_repository.dart';

final class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._apiHandler);

  final ApiHandler _apiHandler;

  @override
  Future<ApiResponse<PaginationResponse<OrderResponse>>> orders({
    required int page,
    required int limit,
  }) {
    return _apiHandler.request(
      path: '/orders/',
      method: MethodType.get,
      queryParameters: {
        'page': page,
        'limit': limit,
      },
      responseMapper: (json) => PaginationResponse.fromJson(
        json,
        (v) => OrderResponse.fromJson(v! as Map<String, dynamic>),
      ),
    );
  }
}
