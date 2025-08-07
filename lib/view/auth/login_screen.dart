import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priya_freshmeats_delivery/res/constants/color.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final colorscheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColor.primaryBlackshade,
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.4,
            width: double.infinity,
            child: Image.asset(
              'assets/images/loginscreen.jpg',
              fit: BoxFit.cover,
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25).r,
                decoration: BoxDecoration(color: colorscheme.primaryContainer),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Welcome To\n Priya Fresh Meats",
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold,
                            color: colorscheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: colorscheme.secondary,
                              thickness: 1,
                              endIndent: 8,
                            ),
                          ),
                          Text(
                            " Login or Sign Up ",
                            style: TextStyle(
                              color: colorscheme.onPrimary,
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: colorscheme.secondary,
                              thickness: 1,
                              endIndent: 8,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        style: TextStyle(color: colorscheme.onPrimary),
                        decoration: InputDecoration(
                          prefixText: '+91 | ',
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: " Enter Phone Number",
                          hintStyle: TextStyle(
                            color: colorscheme.onPrimary,
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          counterText: "",
                          filled: true,
                          fillColor: colorscheme.primaryContainer,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12).r,
                            borderSide: BorderSide(
                              color: colorscheme.onPrimary,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12).r,
                            borderSide: BorderSide(
                              color: colorscheme.onPrimary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12).r,
                            borderSide: BorderSide(
                              color: colorscheme.onPrimary,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12).r,
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12).r,
                            borderSide: BorderSide(
                              color: colorscheme.onPrimary,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesName.otpscreen,
                              arguments: phoneController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorscheme.primary,
                            padding:  EdgeInsets.symmetric(vertical: 15.w),
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
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
