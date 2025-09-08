import 'package:intl/intl.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isOngoing = true;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((value) async {
      final provider = Provider.of<OrdersViewmodel>(context, listen: false);
      await provider.fetchOnGoingOrder();
      await provider.fetchCompletedOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0).r,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isOngoing = !isOngoing;
                  _pageController.animateToPage(
                    isOngoing ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Container(
                width: width * 0.9,
                height: 45.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryBlack, width: 0.2),
                  borderRadius: BorderRadius.circular(15).r,
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment:
                          isOngoing
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        width: width * 0.425,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color:
                              isOngoing
                                  ? Colors.orange.shade400
                                  : Colors.green.shade400,
                          borderRadius: BorderRadius.circular(15).r,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "OnGoing",
                              style: GoogleFonts.poppins(
                                fontSize: 18.0.sp,
                                color:
                                    isOngoing ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Completed",
                              style: GoogleFonts.poppins(
                                fontSize: 18.0.sp,
                                color:
                                    !isOngoing ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            isOngoing = index == 0;
          });
        },
        children: const [OnGoingOrdersTab(), CompletedOrdersTab()],
      ),
    );
  }
}

class OnGoingOrdersTab extends StatelessWidget {
  const OnGoingOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;

    return Consumer<OrdersViewmodel>(
      builder: (context, provider, child) {
        if (provider.ongoingOrderDetail.isEmpty) {
          return Center(
            child: Text(
              "No OnGoing Orders",
              style: GoogleFonts.poppins(fontSize: 16.sp),
            ),
          );
        }
        final onGoingOrders = provider.ongoingOrderDetail[0].orderDetails;
        debugPrint(onGoingOrders.length.toString());

        return Skeletonizer(
          enabled: provider.ongoingOrderLoading,
          child: ListView.builder(
            itemCount: onGoingOrders.length,
            itemBuilder: (context, index) {
              final order = onGoingOrders[index];
              return Padding(
                padding: const EdgeInsets.all(10).r,
                child: Container(
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
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.motorcycle,
                      color: colorscheme.primary,
                    ),
                    title: Text(
                      'Order : ${order.name}',
                      style: GoogleFonts.poppins(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Estimated Delivery: ${provider.ongoingOrderDetail[0].estimatedDeliveryTime != null ? DateFormat('hh:mm a').format(provider.ongoingOrderDetail[0].estimatedDeliveryTime!) : "N/A"}',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondaryBlack,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class CompletedOrdersTab extends StatelessWidget {
  const CompletedOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersViewmodel>(
      builder: (context, provider, child) {
        if (provider.oncompletedOrderData.isEmpty) {
          return Center(
            child: Text(
              "No Completed Orders",
              style: GoogleFonts.poppins(fontSize: 16.sp),
            ),
          );
        }
        final completedOrders = provider.oncompletedOrderData[0].orderDetails;

        return Skeletonizer(
          enabled: provider.oncompletedOrderLoading,
          child: ListView.builder(
            itemCount: completedOrders.length,
            itemBuilder: (context, index) {
              final order = completedOrders[index];
              return Padding(
                padding: const EdgeInsets.all(10.0).r,
                child: Container(
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
                  child: ListTile(
                    leading: Image.asset(
                      "assets/images/accept.png",
                      color: Colors.green.shade400,
                      height: 30.h,
                      width: 40.w,
                    ),
                    title: Text(
                      'Order : ${order.name}',
                      style: GoogleFonts.poppins(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      'Delivered on: ${DateFormat('dd MMM yyyy').format(provider.oncompletedOrderData[0].actualDeliveryTime)}',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
