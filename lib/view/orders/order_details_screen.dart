import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorscheme.surface,
      appBar: AppBar(
        title: Text(
          'Order Details',
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
                // SizedBox(height: 30.0.h),
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
                            'assets/images/orderdetails.jpeg',
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
                                    "JP Nagar, Bangalore, Karnataka.",
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
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.orderaddressscreen,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF93DA97),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8).r,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/accept.png",
                                          height: 20.h,
                                          width: 20.w,
                                          color: AppColor.primaryBlack,
                                        ),
                                        SizedBox(width: 5.0.w),
                                        Text(
                                          "Accept",
                                          style: GoogleFonts.alata(
                                            color: AppColor.primaryBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colorscheme.primary,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/rejectorder.png",
                                          height: 20.h,
                                          width: 20.w,
                                          color: AppColor.textWhite,
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(
                                          "Reject",
                                          style: GoogleFonts.alata(
                                            color: AppColor.textWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0.sp,
                                          ),
                                        ),
                                      ],
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
