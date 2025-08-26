import 'package:priya_freshmeats_delivery/data/models/orders/order_accept_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/order_details_model.dart';
import 'package:priya_freshmeats_delivery/data/repository/orders_rep/orders_repository.dart';
import 'package:priya_freshmeats_delivery/res/components/toast_helper.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OrdersViewmodel with ChangeNotifier {
  final OrdersRepository _repository = OrdersRepository();
  OrderData _orderData = OrderData(
    id: "",
    orderId: "",
    clientName: "",
    phone: "",
    amount: 0,
    location: "",
    pincode: "",
    items: [],
    status: "",
    store: Store(
      id: '',
      name: '',
      location: '',
      phone: '',
      lat: 0.0,
      long: 0.0,
    ),
    notes: '',
    isUrgent: false,
  );
  OrderData get orderData => _orderData;

  bool _isOrderDetailsLoading = false;
  bool get isOrderDetailsLoading => _isOrderDetailsLoading;

  set isOrderDetailsLoading(bool value) {
    _isOrderDetailsLoading = value;
    notifyListeners();
  }

  bool _isOrderAccepting = false;
  bool get isOrderAccepting => _isOrderAccepting;

  set isOrderAccepting(bool value) {
    _isOrderAccepting = value;
    notifyListeners();
  }

  CustomerOrder _customerdata = CustomerOrder(
    geoLocation: GeoLocation(type: "", coordinates: []),
    id: '',
    customer: '',
    clientName: '',
    location: '',
    pincode: '',
    orderDetails: [],
    phone: '',
    amount: 0,
    status: '',
    store: '',
    manager: '',
    notes: '',
    isUrgent: false,
    deliveryStatus: '',
    deliveryRejectionReason: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    v: 0,
    pickedUpBy: '',
    deliveryPartner: '',
    pickedUpAt: DateTime.now(),
  );
  CustomerOrder get customerdata => _customerdata;

  bool _isOrderRejecting = false;
  bool get isOrderRejecting => _isOrderRejecting;

  set isOrderRejecting(bool value) {
    _isOrderRejecting = value;
    notifyListeners();
  }

  Future<void> fetchOrderDetails(BuildContext context, String orderId) async {
    isOrderDetailsLoading = true;
    try {
      final result = await _repository.fetchOrderDetails(orderId);
      if (result.success) {
        _orderData = result.data!;
        debugPrint(result.data!.orderId);
        notifyListeners();
      } else {
        debugPrint(result.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isOrderDetailsLoading = false;
      notifyListeners();
    }
  }

  Future<void> acceptOrder(BuildContext context, String orderId) async {
    isOrderAccepting = true;
    try {
      final result = await _repository.acceptOrder(orderId);

      if (result.success) {
        debugPrint("Accepted Order SuccessFully");
        _customerdata = result.data.order;
        Navigator.pushNamed(
          context,
          RoutesName.orderaddressscreen,
          arguments: orderId,
        );
        notifyListeners();
      } else {
        debugPrint("Entered into Else Block of accept order");
        ToastHelper.showSuccess(
          context: context,
          message: "Order Out for Delivery",
        );
        debugPrint(result.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isOrderAccepting = false;
      notifyListeners();
    }
  }

  Future<void> rejectOrder(BuildContext context, String orderId) async {
    isOrderRejecting = true;
    try {
      final result = await _repository.rejectOrder(orderId);
      if (result.success) {
        debugPrint("Rejected Order SuccessFully");
        Navigator.pop(context);
        notifyListeners();
      } else {
        ToastHelper.showError(
          context: context,
          message: "Order Out for Delivery",
        );
        debugPrint(result.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isOrderRejecting = false;
      notifyListeners();
    }
  }

  Future<void> initiateDelivery(BuildContext context, String orderId) async {
    try {
      final result = await _repository.initiateDelivery(orderId);

      if (result.success) {
        debugPrint("Order  Initiated: $orderId");
        notifyListeners();
      } else {
        debugPrint(result.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> orderDelivered(BuildContext context, String orderId) async {
    try {
      final result = await _repository.orderDelivered(orderId);

      if (result.success) {
        debugPrint("Order  Delivered: $orderId");
        notifyListeners();
      } else {
        debugPrint(result.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> notDelivered(
    BuildContext context,
    String orderId,
    String reason,
  ) async {
    try {
      final result = await _repository.orderNotDelivered(orderId, reason);

      if (result.success) {
        debugPrint("Order Not Delivered: $reason");
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.bottomnavbar,
          (route) => false,
        );
      } else {
        debugPrint(result.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
