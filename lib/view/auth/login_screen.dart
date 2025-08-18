import 'dart:ui';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/loginbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colorScheme.shadow, Color(0xB3D32F2F)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      'Sign in to continue',
                      style: GoogleFonts.alata(
                        color: colorScheme.onPrimary,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16).r,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16).r,
                        ),
                        color: Color(0x33FFB3B3),

                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 20,
                              ).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter Phone Number",
                                style: GoogleFonts.alata(
                                  letterSpacing: 1,
                                  color: colorScheme.onPrimary,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextField(
                                controller: phoneController,
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  hintStyle: GoogleFonts.alata(
                                    color: colorScheme.onSurface,
                                    fontSize: 15.sp,
                                  ),

                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: colorScheme.primary,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: colorScheme.outline,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: colorScheme.outline,
                                    ),
                                  ),

                                  filled: true,
                                  fillColor: colorScheme.primaryContainer,
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              SizedBox(height: 16.h),

                              SizedBox(height: 20.h),

                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesName.otpscreen,
                                      arguments: phoneController.text.trim(),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(60.w, 50.h),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: colorScheme.primary,
                                    foregroundColor: colorScheme.onPrimary,
                                    elevation: 4,
                                  ),
                                  child: Text(
                                    'Send OTP',
                                    style: GoogleFonts.alata(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
