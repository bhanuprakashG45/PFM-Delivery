import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view/orders/notdelivered_screen.dart';

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
              (BuildContext context) => OtpScreen(phonenumber: phoneNumber),
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
        return MaterialPageRoute(
          builder: (BuildContext context) => OrderDetailsScreen(),
        );
      case RoutesName.bottomnavbar:
        return MaterialPageRoute(
          builder: (BuildContext context) => BottomNavBar(initialIndex: 0),
        );
      case RoutesName.orderaddressscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrderAddressScreen(),
        );
      case RoutesName.viewallordersscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ViewallOrdersScreen(),
        );
      case RoutesName.ordersscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const OrdersScreen(),
        );
      case RoutesName.mydocumentsscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => MydocumentsScreen(),
        );
      case RoutesName.notDeliveredScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) =>const NotDeliveredScreen(),
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
