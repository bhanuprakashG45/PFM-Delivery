import 'package:priya_freshmeats_delivery/utils/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPref _pref = SharedPref();
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    Future.delayed(Duration(seconds: 5), () async {
      String? token = await _pref.getAccessToken();
      debugPrint("token:$token");
      if (token != null) {
        Navigator.pushReplacementNamed(context, RoutesName.bottomnavbar);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.loginscreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorscheme.onPrimary,
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset("assets/images/splashscreendelboy.png")],
      ),
    );
  }
}
