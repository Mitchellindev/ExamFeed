import 'package:exam_feed/app/service_locator.dart';
import 'package:exam_feed/core/models/order.dart';
import 'package:exam_feed/features/dashboard/repository/dashboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DashboardProvider extends ChangeNotifier {
  static DashboardProvider? _instance;

  DashboardProvider() {
    _dasboardRepository = locator.get<DashboardRepository>();
  }

  static DashboardProvider get instance {
    _instance ??= DashboardProvider();
    return _instance!;
  }

  late final DashboardRepository _dasboardRepository;

  final PagingController<int, OrderResponse> pagingController =
      PagingController(firstPageKey: 1);

  Future<void> orders() async {
    final pageKey = pagingController.nextPageKey;
    final response =
        await _dasboardRepository.orders(page: pageKey ?? 1, limit: 100);

    response.when(
      success: (data) {
        pagingController
            .appendLastPage(data?.data?.results.toSet().toList() ?? []);
        return;

        // pagingController.appendPage(
        //   data?.data?.results.toSet().toList() ?? [],
        //   (pageKey ?? 1) + 1,
        // );
      },
      error: (error) {
        pagingController.error = error;
      },
    );
  }
}
