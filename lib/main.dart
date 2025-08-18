import 'package:priya_freshmeats_delivery/utils/exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.43, 867.43),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        final baseTextTheme = GoogleFonts.montserratTextTheme();
        final materialTheme = MaterialTheme(baseTextTheme);
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BottomViewmodel()),
            ChangeNotifierProvider(create: (_) => LoginViewModel()),
          ],
          child: Consumer(
            builder: (context, LoginViewModel loginprovider, child) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Priya Fresh Meats Delivery',
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
