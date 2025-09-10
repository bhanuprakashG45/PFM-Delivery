import 'package:flutter/gestures.dart';
import 'package:priya_freshmeats_delivery/res/components/toast_helper.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool isButtonEnabled = false;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      setState(() {
        isButtonEnabled = _phoneController.text.length == 10;
      });
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Consumer<LoginViewModel>(
          builder: (context, loginprovider, child) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      'assets/images/bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Center(
                        child: Image.asset(
                          "assets/images/splashfinal.png",
                          height: screenheight * 0.2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          'Login with your mobile number',
                          style: GoogleFonts.alata(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              '+91',
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 24.h,
                              width: 1,
                              color: Colors.grey.shade400,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: TextField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Enter Mobile Number',
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.poppins(
                                    color: AppColor.secondaryBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed:
                              isButtonEnabled
                                  ? () async {
                                    final phoneNumber = _phoneController.text;
                                    bool result = await loginprovider.userLogin(
                                      context,
                                      phoneNumber,
                                    );
                                    if (context.mounted && result == false) {
                                      ToastMessage.showToast(
                                        context,
                                        message: "User not Found",
                                        icon: Icon(
                                          Icons.error,
                                          color: colorscheme.primary,
                                        ),
                                      );
                                    }
                                  }
                                  : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isButtonEnabled
                                    ? colorscheme.primary
                                    : Colors.grey.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 0,
                          ),
                          child:
                              loginprovider.isLoading
                                  ? SizedBox(
                                    height: 20.h,
                                    width: 20.w,
                                    child: CircularProgressIndicator(
                                      color: colorscheme.onPrimary,
                                      strokeWidth: 2.0.w,
                                    ),
                                  )
                                  : Text(
                                    'Get OTP',
                                    style: GoogleFonts.alata(
                                      fontSize: 18.sp,
                                      color: colorscheme.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: 'By logging in, you agree to our ',
                            style: TextStyle(
                              color: AppColor.primaryBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms & Conditions',
                                style: TextStyle(
                                  color: colorscheme.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchUrl(
                                          "https://pfm.kods.app/delivery-partner/terms-and-condition",
                                        );
                                      },
                              ),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(color: AppColor.primaryBlack),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: colorscheme.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        _launchUrl(
                                          "https://pfm.kods.app/delivery-partner/privacy-policy",
                                        );
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
