import 'package:intl/intl.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/home_vm/home_viewmodel.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';
import 'package:priya_freshmeats_delivery/view_model/profile_vm/profile_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final homeProvider = Provider.of<HomeViewmodel>(context, listen: false);
      final profileProvider = Provider.of<ProfileViewmodel>(
        context,
        listen: false,
      );
      final orderprovider = Provider.of<OrdersViewmodel>(
        context,
        listen: false,
      );
      await homeProvider.fetchOrderStats();
      await orderprovider.fetchOnGoingOrder();
      await profileProvider.fetchProfileDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Consumer<ProfileViewmodel>(
          builder: (context, provider, child) {
            final name = provider.name;
            return provider.isProfileLoading
                ? SizedBox(
                  height: 10.h,
                  width: 10.w,
                  child: CircularProgressIndicator(
                    color: colorscheme.primary,
                    strokeWidth: 2.0.w,
                  ),
                )
                : Text(
                  "Welcome ${name.isNotEmpty ? name : "User"}",
                  style: GoogleFonts.poppins(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryBlack,
                  ),
                  textAlign: TextAlign.start,
                );
          },
        ),
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        top: false,
        child: Consumer<HomeViewmodel>(
          builder: (context, provider, child) {
            final ordersCount = provider.ordersCount;
            return Skeletonizer(
              enabled: provider.isOrderStatsLoading,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Consumer<HomeViewmodel>(
                          builder: (context, provider, _) {
                            final isOnline = provider.isOnline;

                            return InkWell(
                              onTap: () {
                                provider.toggleOnline();
                              },
                              child: Container(
                                width: width * 0.9,
                                height: 45.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.primaryBlackshade,
                                    width: 0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(20).r,
                                ),
                                child: Stack(
                                  children: [
                                    AnimatedAlign(
                                      alignment:
                                          isOnline
                                              ? Alignment.centerLeft
                                              : Alignment.centerRight,
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      child: Container(
                                        width: width * 0.425,
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          color:
                                              isOnline
                                                  ? Colors.green.shade400
                                                  : Colors.red.shade400,
                                          borderRadius:
                                              BorderRadius.circular(20).r,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Online",
                                              style: GoogleFonts.poppins(
                                                color:
                                                    isOnline
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17.0.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Offline",
                                              style: GoogleFonts.poppins(
                                                color:
                                                    !isOnline
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17.0.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 20.0.h),

                      Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15).r,
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15).r,
                                child: Image.asset(
                                  'assets/images/homepageimagedriver.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.0.h),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15).r,
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 230, 229, 229),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.6),
                              spreadRadius: -4,
                              blurRadius: 10,
                              offset: Offset(0, -2),
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 22.0.h,
                                    width: 5.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10).r,
                                      color: colorscheme.primary,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "Orders",
                                    style: GoogleFonts.poppins(
                                      fontSize: 22.0.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),

                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.viewallordersscreen,
                                      );
                                    },
                                    child: Text(
                                      "view all  ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: colorscheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          ordersCount.totalOrders.toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.primaryBlack,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "Today Orders",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.blackshade,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          PieChart(
                                            dataMap: {
                                              "Accept":
                                                  ordersCount.accepted
                                                      .toDouble(),
                                              "Reject":
                                                  ordersCount.rejected
                                                      .toDouble(),
                                            },
                                            chartRadius: 40,
                                            colorList: [
                                              Colors.green.shade400,
                                              Colors.red.shade400,
                                            ],
                                            chartType: ChartType.ring,
                                            ringStrokeWidth: 8,
                                            legendOptions: LegendOptions(
                                              showLegends: false,
                                            ),
                                            chartValuesOptions:
                                                ChartValuesOptions(
                                                  showChartValues: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 12.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 8.w,
                                                height: 8.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.green.shade400,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Accept",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.blackshade,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade400,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Reject",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColor.blackshade,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0.h),
                      provider.isOnline
                          ? Consumer<OrdersViewmodel>(
                            builder: (context, provider, child) {
                              if (provider.ongoingOrderDetail.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No OnGoing Order",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              }
                              final orderdata =
                                  provider.ongoingOrderDetail[0].orderDetails;
                              if (orderdata.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No OnGoing Order",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              }
                              return Skeletonizer(
                                enabled: provider.ongoingOrderLoading,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15).r,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                          255,
                                          230,
                                          229,
                                          229,
                                        ),
                                        spreadRadius: 4,
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                        offset: Offset(0, -2),
                                      ),
                                    ],
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0).r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 22.0.h,
                                              width: 5.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10).r,
                                                color: colorscheme.primary,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              "OnGoing Order",
                                              style: GoogleFonts.poppins(
                                                fontSize: 22.0.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),

                                        Center(
                                          child: FaIcon(
                                            FontAwesomeIcons.motorcycle,
                                            color: AppColor.primaryBlackshade,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),

                                        Padding(
                                          padding: const EdgeInsets.all(10.0).r,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${orderdata[0].name} Quantity: ${orderdata[0].quantity}",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.secondaryBlack,
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 10.h),

                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 2.0.w),
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .locationDot,
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
                                                      provider
                                                          .ongoingOrderDetail[0]
                                                          .location,
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColor
                                                                .primaryBlackshade,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            40,
                                                          ).r,
                                                    ),
                                                    child: Icon(
                                                      Icons.bolt_rounded,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    provider
                                                                .ongoingOrderDetail
                                                                .isNotEmpty &&
                                                            provider
                                                                    .ongoingOrderDetail[0]
                                                                    .estimatedDeliveryTime !=
                                                                null
                                                        ? DateFormat(
                                                          'dd MMM yyyy, hh:mm a',
                                                        ).format(
                                                          provider
                                                              .ongoingOrderDetail[0]
                                                              .estimatedDeliveryTime!,
                                                        )
                                                        : "ETA not available",
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColor
                                                              .primaryBlackshade,
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
                                ),
                              );
                            },
                          )
                          : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15).r,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    255,
                                    230,
                                    229,
                                    229,
                                  ),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.6),
                                  spreadRadius: -4,
                                  blurRadius: 10,
                                  offset: Offset(0, -2),
                                ),
                              ],
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(10.0).r,
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 22.0.h,
                                          width: 5.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10).r,
                                            color: colorscheme.primary,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        Expanded(
                                          child: Text(
                                            "No Ongoing Order",
                                            style: GoogleFonts.poppins(
                                              fontSize: 22.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),

                                    Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.motorcycle,
                                        color: AppColor.primaryBlackshade,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Center(
                                      child: Text(
                                        "Please go online to Take orders",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlackshade,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
