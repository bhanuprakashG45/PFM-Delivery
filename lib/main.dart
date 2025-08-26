import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.43, 867.43),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        final baseTextTheme = GoogleFonts.openSansTextTheme();
        final materialTheme = MaterialTheme(baseTextTheme);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BottomViewmodel()),
            ChangeNotifierProvider(create: (_) => LoginViewModel()),
            ChangeNotifierProvider(create: (_) => OrdersViewmodel()),
          ],
          child: Consumer(
            builder: (context, LoginViewModel loginprovider, child) {
              return MaterialApp(
                // navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'PFM-Delivery',
                theme: materialTheme.light(),
                initialRoute: RoutesName.splashscreen,
                onGenerateRoute: Routes.generateRoute,
              );
            },
          ),
        );
      },
    );
  }
}
