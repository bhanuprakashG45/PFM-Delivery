import 'package:priya_freshmeats_delivery/data/models/orders/accepted_orders_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/completed_orders_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/ongoing_order_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/order_accept_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/order_details_model.dart';
import 'package:priya_freshmeats_delivery/data/models/orders/rejected_orders_model.dart';
import 'package:priya_freshmeats_delivery/data/repository/orders_rep/orders_repository.dart';
import 'package:priya_freshmeats_delivery/res/components/toast_helper.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OrdersViewmodel with ChangeNotifier {
  final OrdersRepository _repository = OrdersRepository();

  bool _isAccepted = true;

  bool get isAccepted => _isAccepted;

  void toggleAccepted(bool value) {
    _isAccepted = value;
    notifyListeners();
  }

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

  List<OnGoingOrderData> _ongoingOrderDetail = [];
  List<OnGoingOrderData> get ongoingOrderDetail => _ongoingOrderDetail;
  bool _ongoingOrderLoading = false;
  bool get ongoingOrderLoading => _ongoingOrderLoading;

  set ongoingOrderLoading(bool value) {
    _ongoingOrderLoading = value;
    notifyListeners();
  }

  List<CompletedOrder> _oncompletedOrderData = [];
  List<CompletedOrder> get oncompletedOrderData => _oncompletedOrderData;
  bool _oncompletedOrderLoading = false;
  bool get oncompletedOrderLoading => _oncompletedOrderLoading;

  set oncompletedOrderLoading(bool value) {
    _oncompletedOrderLoading = value;
    notifyListeners();
  }

  AcceptedOrder _acceptedOrderData = AcceptedOrder(
    orders: [],
    pagination: AcceptedOrderPagination(),
  );
  AcceptedOrder get acceptedOrderData => _acceptedOrderData;
  bool _acceptedOrderLoading = false;
  bool get acceptedOrderLoading => _acceptedOrderLoading;

  set acceptedOrderLoading(bool value) {
    _acceptedOrderLoading = value;
    notifyListeners();
  }

  RejectedOrder _rejectedOrderData = RejectedOrder(
    orders: [],
    pagination: RejectedOrderPagination(
      currentPage: 0,
      totalPages: 0,
      totalOrders: 0,
      hasNext: false,
      hasPrev: false,
    ),
  );
  RejectedOrder get rejectedOrderData => _rejectedOrderData;
  bool _rejectedOrderDataLoading = false;
  bool get rejectedOrderDataLoading => _rejectedOrderDataLoading;

  set rejectedOrderDataLoading(bool value) {
    _rejectedOrderDataLoading = value;
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
        ToastMessage.showToast(
          context,
          message: "Order Accepted",
          icon: Icon(Icons.check, color: Colors.green),
        );
        Navigator.pushNamed(
          context,
          RoutesName.orderaddressscreen,
          arguments: orderId,
        );
        notifyListeners();
      } else {
        debugPrint("Entered into Else Block of accept order");
        ToastMessage.showToast(
          context,
          message: "Order Out for Delivery",
          icon: Icon(Icons.check, color: Colors.green),
        );
        debugPrint(result.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
      ToastMessage.showToast(
        context,
        message: "Order Out for Delivery",
        icon: Icon(Icons.check, color: Colors.green),
      );
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
        ToastMessage.showToast(
          context,
          message: "Order Out for Delivery",
          icon: Icon(Icons.check, color: Colors.green),
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

  Future<void> fetchOnGoingOrder() async {
    ongoingOrderLoading = true;
    try {
      final result = await _repository.fetchOngoingOrders();
      if (result.success) {
        _ongoingOrderDetail = result.data;
        debugPrint("Fetched Ongoing Orders Successfully");
      } else {
        debugPrint(result.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      ongoingOrderLoading = false;
    }
  }

  Future<void> fetchCompletedOrders() async {
    oncompletedOrderLoading = true;
    try {
      final result = await _repository.fetchCompletedOrders();
      if (result.success) {
        _oncompletedOrderData = result.data;
        debugPrint("Fetched Completed Orders Successfully");
      } else {
        debugPrint(result.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      oncompletedOrderLoading = false;
    }
  }

  Future<void> fetchAcceptedOrders() async {
    acceptedOrderLoading = true;
    try {
      final response = await _repository.fetchAcceptedOrders();
      if (response.success) {
        _acceptedOrderData = response.data;
        debugPrint(response.message);
      } else {
        debugPrint(response.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      acceptedOrderLoading = false;
    }
  }

  Future<void> fetchRejectedOrders() async {
    rejectedOrderDataLoading = true;
    try {
      final response = await _repository.fetchRejectedOrders();
      if (response.success) {
        _rejectedOrderData = response.data;
        debugPrint(response.message);
      } else {
        debugPrint(response.message);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      rejectedOrderDataLoading = false;
    }
  }
}
