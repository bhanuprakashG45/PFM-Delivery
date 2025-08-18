import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OtpScreen extends StatefulWidget {
  final String phonenumber;
  const OtpScreen({super.key, required this.phonenumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late List<TextEditingController> otpControllers;

  @override
  void initState() {
    super.initState();
    otpControllers = List.generate(6, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: colorScheme.primary,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 400.h,
                child: Container(
                  decoration: BoxDecoration(color: colorScheme.primary),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Center(
                        child: Text(
                          "We have sent a code to your Mobile Number",
                          style: GoogleFonts.alata(
                            fontSize: 16.sp,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.w,
                            vertical: 40.h,
                          ),
                          child: Consumer<LoginViewModel>(
                            builder: (context, loginprovider, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Enter OTP",
                                            style: TextStyle(
                                              color: colorScheme.secondary,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OtpTimerButton(
                                            onPressed: () async {},
                                            backgroundColor:
                                                colorScheme.onPrimary,
                                            text: Text(
                                              "Resend otp",
                                              style: TextStyle(
                                                color: colorScheme.tertiary,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            duration: 30,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 30.h),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: colorScheme.primaryContainer,
                                          borderRadius:
                                              BorderRadius.circular(15).r,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: List<Widget>.generate(
                                                6,
                                                (index) {
                                                  return _textFieldOTP(
                                                    first: index == 0,
                                                    last: index == 5,
                                                    isLoading:
                                                        loginprovider
                                                            .isVerifying,
                                                    controller:
                                                        otpControllers[index],
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40.h),
                                  AppTextButton(
                                    text: "VERIFY",
                                    isLoading: loginprovider.isVerifying,
                                    onTap: () async {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.bottomnavbar,
                                        arguments: PageController(
                                          initialPage: 0,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textFieldOTP({
    required bool first,
    required bool last,
    required bool isLoading,
    required TextEditingController controller,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && !last) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && !first) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: isLoading,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            filled: true,
            fillColor: colorScheme.onPrimary,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(15.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: colorScheme.primary),
              borderRadius: BorderRadius.circular(12).r,
            ),
          ),
        ),
      ),
    );
  }
}
