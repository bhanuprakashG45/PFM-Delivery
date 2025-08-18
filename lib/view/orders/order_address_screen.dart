import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OrderAddressScreen extends StatefulWidget {
  const OrderAddressScreen({super.key});

  @override
  State<OrderAddressScreen> createState() => _OrderAddressScreenState();
}

class _OrderAddressScreenState extends State<OrderAddressScreen> {
  bool isOrderAccepted = false;

  Future<void> _launchMap() async {
    final Uri uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=12.9186,77.5163",
    );
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      isOrderAccepted = true;
    });
  }

  Future<void> makePhoneCall(String countrycode, String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: countrycode + phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorscheme.surface,
      appBar: AppBar(
        title: Text(
          'Order Address',
          style: TextStyle(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorscheme.surface,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25).r,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.r),
                            topRight: Radius.circular(25.r),
                          ),
                          child: Image.asset(
                            'assets/images/acceptorder.jpeg',
                            height: 300.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(10.0).r,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sumukh Mohan",
                                  style: GoogleFonts.alata(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryBlack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Chicken curry cut with skin,a pop of flavor and a hint of spice, perfect for your next meal.",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorscheme.secondary,
                                ),
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 2.0.w),
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  color: const Color.fromARGB(
                                    255,
                                    251,
                                    103,
                                    93,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Text(
                                    "JP Nagar, Bangalore, Karnataka",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: colorscheme.secondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(40).r,
                                  ),
                                  child: Icon(
                                    Icons.bolt_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Today in 30 mins",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: colorscheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                isOrderAccepted
                    ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RoutesName.bottomnavbar,

                                  arguments: PageController(initialPage: 0),
                                  (route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15).r,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.thumbsUp,
                                        color: Colors.white,
                                        size: 15.sp,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "Order Delivered",
                                        style: GoogleFonts.alata(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.notDeliveredScreen,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade400,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15).r,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.thumbsDown,
                                        color: Colors.white,
                                        size: 15.sp,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "Not Delivered",
                                        style: GoogleFonts.alata(
                                          fontSize: 20.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                    : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await _launchMap();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorscheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15).r,
                                ),
                              ),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.locationDot,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "Initiate Delivery",
                                    style: GoogleFonts.alata(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await makePhoneCall('+91', "9110328582");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15).r,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.call, color: Colors.white, size: 20.sp),
                          SizedBox(width: 10.w),
                          Text(
                            "Call Customer",
                            style: GoogleFonts.alata(
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
