import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priya_freshmeats_delivery/res/constants/color.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes_name.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  bool showResend = false;

  void verifyOtp() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length < 4) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter all 4 digits')));
      return;
    }
    setState(() {
      showResend = true;
    });
  }

  void resendOtp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP resent to ${widget.phoneNumber}')),
    );

    for (var controller in _otpControllers) {
      controller.clear();
    }

    setState(() {
      showResend = false;
    });
  }

  Widget buildOtpFields() {
    final colorscheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 60.w,
          margin: EdgeInsets.symmetric(horizontal: 10).r,
          child: TextField(
            controller: _otpControllers[index],
            style: TextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.isNotEmpty && index < 3) {
                FocusScope.of(context).nextFocus();
              }
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: colorscheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.neonGreen),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12).r,
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style: TextStyle(
            color: colorscheme.onPrimary,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorscheme.primaryContainer,
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: colorscheme.onPrimary),
      ),
      backgroundColor: colorscheme.primaryContainer,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/otp.png", height: 200.h, width: 200.w),

              Text(
                "Enter the 4-digit OTP sent to ${widget.phoneNumber}",
                style: TextStyle(
                  color: colorscheme.onPrimary,
                  fontSize: 22.0.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
              buildOtpFields(),
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.homescreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorscheme.primary,
                    padding: EdgeInsets.symmetric(vertical: 15.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textWhite,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the OTP?",
                    style: TextStyle(
                      color: colorscheme.secondary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('OTP resent to ${widget.phoneNumber}'),
                        ),
                      );
                    },
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                        color: colorscheme.onPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
