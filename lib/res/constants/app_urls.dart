class AppUrls {
  static const String baseUrl =
      'https://pfm-backend-1gdg.onrender.com/deliveryPartner';

  // Authentication
  static const String loginUrl = '$baseUrl/send-otp';
  static const String otpUrl = '$baseUrl/verify-login';
  static const String refreshTokenUrl = '$baseUrl/refresh-token';

  //Profile
  static const String contactusUrl = '$baseUrl/contact-us';
  static const String profileDetailsUrl = '$baseUrl/profile/info';
  static const String documentsStatusUrl = '$baseUrl/documents/status';
  static const String editProfileUrl = '$baseUrl/profile/edit';
  static const String deleteAccountUrl = '$baseUrl/profile';

  //Orders
  static const String orderDetailsUrl = '$baseUrl/scan-qr';
  static const String acceptOrderUrl = '$baseUrl/respond-order';
  static const String rejectOrderUrl = '$baseUrl/respond-order';
  static const String initiateOrderUrl = '$baseUrl/initiate-delivery';
  static const String deliveredUrl = '$baseUrl/mark-delivered';
  static const String notDeliveredUrl = '$baseUrl/reject-delivery';
  static const String rejectedOrdersUrl = '$baseUrl/orders/rejected';
  static const String acceptedOrdersUrl = '$baseUrl/orders/accepted';
  static const String ongoingOrdersUrl = '$baseUrl/ongoing-orders';
  static const String completedOrdersUrl = '$baseUrl/completed-orders';

  //Home
  static const String orderStatsUrl = '$baseUrl/dashboard/today-stats';
}
