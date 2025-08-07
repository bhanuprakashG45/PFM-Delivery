import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:priya_freshmeats_delivery/res/constants/theme.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes_name.dart';

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
        final baseTextTheme = GoogleFonts.ptSerifTextTheme();
        final materialTheme = MaterialTheme(baseTextTheme);

        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Priya Fresh Meats Delivery',
          theme: materialTheme.light(),
          initialRoute: RoutesName.splashscreen,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
