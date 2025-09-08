import 'package:flutter/foundation.dart';
import 'package:priya_freshmeats_delivery/data/models/home/today_order_count_model.dart';
import 'package:priya_freshmeats_delivery/data/repository/home_rep/home_repository.dart';

class HomeViewmodel with ChangeNotifier {
  final HomeRepository _repository = HomeRepository();

  bool _isOnline = true;

  bool get isOnline => _isOnline;

  void toggleOnline() {
    _isOnline = !_isOnline;
    notifyListeners();
  }

  void setOnline(bool value) {
    _isOnline = value;
    notifyListeners();
  }

  OrdersCount _ordersCount = OrdersCount(
    totalOrders: 0,
    accepted: 0,
    rejected: 0,
    ongoing: 0,
    completed: 0,
  );

  OrdersCount get ordersCount => _ordersCount;

  bool _isOrderStatsLoading = false;
  bool get isOrderStatsLoading => _isOrderStatsLoading;

  set isOrderStatsLoading(bool value) {
    _isOrderStatsLoading = value;
    notifyListeners();
  }

  Future<void> fetchOrderStats() async {
    isOrderStatsLoading = true;
    try {
      final response = await _repository.fetchOrderStats();
      if (response.success) {
        _ordersCount =
            response.data ??
            OrdersCount(
              totalOrders: 0,
              accepted: 0,
              rejected: 0,
              ongoing: 0,
              completed: 0,
            );
      } else {
        debugPrint("Failed to fetch order stats: ${response.message}");
      }
    } catch (e) {
      debugPrint("Error in Home Order Stats: $e");
      rethrow;
    } finally {
      isOrderStatsLoading = false;
    }
  }
}
