import 'dart:io';

import 'package:exam_feed/core/api/api_helper.dart';
import 'package:exam_feed/core/api/pagination.dart';
import 'package:exam_feed/core/models/login.dart';
import 'package:exam_feed/core/models/order.dart';
import 'package:exam_feed/core/models/signup.dart';

abstract class DashboardRepository {
  Future<ApiResponse<PaginationResponse<OrderResponse>>> orders({
    required int page,
    required int limit,
  });
}
