import 'package:priya_freshmeats_delivery/core/network/network_api_services.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/accepted_orders_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/completed_orders_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/initiate_delivery_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/not_delivered_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/ongoing_order_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/order_accept_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/order_delivered_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/order_details_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/rejected_orders_model.dart';
import 'package:priya_freshmeats_delivery/res/constants/app_urls.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OrdersRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();
  Future<OrderDetailsModel> fetchOrderDetails(String orderId) async {
    print("Entered into repo");
    try {
      final url = AppUrls.orderDetailsUrl;
      final payload = {"code": orderId};
      final response = await _apiServices.postApiResponse(url, payload);
      debugPrint(response.toString());
      return OrderDetailsModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in verifyOtp: $e");
      rethrow;
    }
  }

  Future<OrderAcceptModel> acceptOrder(String orderId) async {
    try {
      final url = AppUrls.acceptOrderUrl;
      final payload = {"orderId": orderId, "action": "accept"};
      final response = await _apiServices.postApiResponse(url, payload);

      return OrderAcceptModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in verifyOtp: $e");
      rethrow;
    }
  }

  Future<OrderAcceptModel> rejectOrder(String orderId) async {
    try {
      final url = AppUrls.acceptOrderUrl;
      final payload = {"orderId": orderId, "action": "reject"};
      final response = await _apiServices.postApiResponse(url, payload);

      return OrderAcceptModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in verifyOtp: $e");
      rethrow;
    }
  }

  Future<InitiateDeliveryModel> initiateDelivery(String orderId) async {
    try {
      final url = AppUrls.initiateOrderUrl;
      final payload = {"orderId": orderId};
      final response = await _apiServices.postApiResponse(url, payload);

      return InitiateDeliveryModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in Initiate Delivery: $e");
      rethrow;
    }
  }

  Future<OrderDeliveredModel> orderDelivered(String orderId) async {
    try {
      final url = AppUrls.deliveredUrl;
      final payload = {"orderId": orderId};
      final response = await _apiServices.postApiResponse(url, payload);

      return OrderDeliveredModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in Order Delivered : $e");
      rethrow;
    }
  }

  Future<NotDeliveredModel> orderNotDelivered(
    String orderId,
    String reason,
  ) async {
    try {
      final url = AppUrls.notDeliveredUrl;
      final payload = {"orderId": orderId, "reason": reason, "notes": reason};
      final response = await _apiServices.postApiResponse(url, payload);

      return NotDeliveredModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Unexpected error in Not Delivered: $e");
      rethrow;
    }
  }

  Future<AcceptedOrderModel> fetchAcceptedOrders() async {
    try {
      final url = AppUrls.acceptedOrdersUrl;
      final response = await _apiServices.getApiResponse(url);

      return AcceptedOrderModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error Fetching Accepted Orders : $e");
      rethrow;
    }
  }

  Future<RejectedOrderModel> fetchRejectedOrders() async {
    try {
      final url = AppUrls.rejectedOrdersUrl;
      final response = await _apiServices.getApiResponse(url);

      return RejectedOrderModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error Fetching REjected Orders : $e");
      rethrow;
    }
  }

  Future<OnGoingOrderModel> fetchOngoingOrders() async {
    try {
      final url = AppUrls.ongoingOrdersUrl;
      final response = await _apiServices.getApiResponse(url);

      return OnGoingOrderModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error Fetching Ongoing Orders : $e");
      rethrow;
    }
  }

  Future<CompletedOrderModel> fetchCompletedOrders() async {
    try {
      final url = AppUrls.completedOrdersUrl;
      final response = await _apiServices.getApiResponse(url);

      return CompletedOrderModel.fromJson(response);
    } on AppException catch (e) {
      throw e;
    } catch (e) {
      debugPrint("Error Fetching Completed Orders : $e");
      rethrow;
    }
  }
}
