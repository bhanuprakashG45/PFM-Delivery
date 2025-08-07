import 'package:flutter/material.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes_name.dart';
import 'package:priya_freshmeats_delivery/view/auth/login_screen.dart';
import 'package:priya_freshmeats_delivery/view/auth/otp_screen.dart';
import 'package:priya_freshmeats_delivery/view/home/home_screen.dart';
import 'package:priya_freshmeats_delivery/view/home/notification_screen.dart';
import 'package:priya_freshmeats_delivery/view/orders/order_details_screen.dart';
import 'package:priya_freshmeats_delivery/view/profile/profile_screen.dart';
import 'package:priya_freshmeats_delivery/view/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RoutesName.loginscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.otpscreen:
        final phoneNumber = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (BuildContext context) => OtpScreen(phoneNumber: phoneNumber),
        );
      case RoutesName.homescreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.profilescreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ProfileScreen(),
        );
      case RoutesName.notificationscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotificationScreen(),
        );
      case RoutesName.orderdetailsscreen:
        final orderId = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (BuildContext context) => OrderDetailsScreen(orderId: orderId),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) =>
                  const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
