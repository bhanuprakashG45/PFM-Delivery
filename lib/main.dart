import 'package:priya_freshmeats_delivery/core/globalkey.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/home_vm/home_viewmodel.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';
import 'package:priya_freshmeats_delivery/view_model/profile_vm/profile_viewmodel.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ToastificationWrapper(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
            ChangeNotifierProvider(create: (_) => ProfileViewmodel()),
            ChangeNotifierProvider(create: (_) => HomeViewmodel()),
          ],
          child: Consumer(
            builder: (context, LoginViewModel loginprovider, child) {
              return MaterialApp(
                navigatorKey: navigatorKey,
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
