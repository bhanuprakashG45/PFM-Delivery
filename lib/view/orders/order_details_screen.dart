import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/home_vm/home_viewmodel.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderDetailsScreen extends StatefulWidget {
  final orderId;
  const OrderDetailsScreen({super.key, this.orderId});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((value) async {
      final orderDetailsprovider = Provider.of<OrdersViewmodel>(
        context,
        listen: false,
      );
      debugPrint(widget.orderId);
      await orderDetailsprovider.fetchOrderDetails(context, widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: GoogleFonts.poppins(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorscheme.onPrimary,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Consumer2<OrdersViewmodel, HomeViewmodel>(
            builder: (context, orderdetailsprovider, homeprovider, child) {
              final orderdata = orderdetailsprovider.orderData;
              return Skeletonizer(
                enabled: orderdetailsprovider.isOrderDetailsLoading,
                child: Padding(
                  padding: const EdgeInsets.all(10.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                                        orderdata.clientName,
                                        style: GoogleFonts.poppins(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.primaryBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      orderdata.items.isEmpty
                                          ? "Chicken curry cut with skin,a pop of flavor and a hint of spice, perfect for your next meal."
                                          : orderdata.items[0].name,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.secondaryBlack,
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
                                          orderdata.location,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.primaryBlackshade,
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
                                          borderRadius:
                                              BorderRadius.circular(40).r,
                                        ),
                                        child: Icon(
                                          Icons.bolt_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "Today in 30 mins",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.primaryBlackshade,
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
                                          onPressed: () async {
                                            await orderdetailsprovider
                                                .acceptOrder(
                                                  context,
                                                  widget.orderId,
                                                );
                                            await homeprovider
                                                .fetchOrderStats();
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
                                              orderdetailsprovider
                                                      .isOrderAccepting
                                                  ? SizedBox(
                                                    height: 20.h,
                                                    width: 20.w,
                                                    child:
                                                        CircularProgressIndicator(
                                                          color:
                                                              AppColor
                                                                  .primaryBlack,
                                                          strokeWidth: 2.0.w,
                                                        ),
                                                  )
                                                  : Image.asset(
                                                    "assets/images/accept.png",
                                                    height: 20.h,
                                                    width: 20.w,
                                                    color:
                                                        AppColor.primaryBlack,
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
                                          onPressed: () async {
                                            await orderdetailsprovider
                                                .rejectOrder(
                                                  context,
                                                  widget.orderId,
                                                );
                                            await homeprovider
                                                .fetchOrderStats();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                colorscheme.primary,

                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              orderdetailsprovider
                                                      .isOrderRejecting
                                                  ? SizedBox(
                                                    height: 20.h,
                                                    width: 20.w,
                                                    child:
                                                        CircularProgressIndicator(
                                                          color:
                                                              AppColor
                                                                  .textWhite,
                                                          strokeWidth: 2.0.w,
                                                        ),
                                                  )
                                                  : Image.asset(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
