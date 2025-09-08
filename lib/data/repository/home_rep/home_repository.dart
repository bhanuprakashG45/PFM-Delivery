import 'package:priya_freshmeats_delivery/core/network/network_api_services.dart';
import 'package:priya_freshmeats_delivery/data/models/home/today_order_count_model.dart';
import 'package:priya_freshmeats_delivery/res/constants/app_urls.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class HomeRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<TodayOrderCountModel> fetchOrderStats() async {
    try {
      final url = AppUrls.orderStatsUrl;
      final response = await _apiServices.getApiResponse(url);

      return TodayOrderCountModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error Fetching Home Stats : $e");
      rethrow;
    }
  }
}
