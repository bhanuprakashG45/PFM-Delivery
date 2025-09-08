import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ViewallOrdersScreen extends StatefulWidget {
  const ViewallOrdersScreen({super.key});

  @override
  State<ViewallOrdersScreen> createState() => _ViewallOrdersScreenState();
}

class _ViewallOrdersScreenState extends State<ViewallOrdersScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final orderProvider = Provider.of<OrdersViewmodel>(
        context,
        listen: false,
      );
      await orderProvider.fetchAcceptedOrders();
      await orderProvider.fetchRejectedOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorscheme.onPrimary,
      appBar: AppBar(
        title: Text(
          'All Orders',
          style: GoogleFonts.poppins(
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: colorscheme.onPrimary,
        centerTitle: true,
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Consumer<OrdersViewmodel>(
            builder: (context, provider, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.0).r,
                child: GestureDetector(
                  onTap: () {
                    final newState = !provider.isAccepted;
                    provider.toggleAccepted(newState);
                    _pageController.animateToPage(
                      newState ? 0 : 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: width * 0.9,
                    height: 45.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.primaryBlackshade,
                        width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(15).r,
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment:
                              provider.isAccepted
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                          duration: const Duration(milliseconds: 250),
                          child: Container(
                            width: width * 0.425,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color:
                                  provider.isAccepted
                                      ? Colors.green.shade400
                                      : Colors.red.shade400,
                              borderRadius: BorderRadius.circular(15).r,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Accepted",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0.sp,
                                    color:
                                        provider.isAccepted
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "Rejected",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.0.sp,
                                    color:
                                        !provider.isAccepted
                                            ? Colors.white
                                            : Colors.black87,
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
              );
            },
          ),
        ),
      ),
      body: Consumer<OrdersViewmodel>(
        builder: (context, provider, child) {
          return Skeletonizer(
            enabled:
                provider.acceptedOrderLoading ||
                provider.rejectedOrderDataLoading,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                provider.toggleAccepted(index == 0);
              },
              children: const [AcceptedOrdersTab(), RejectedOrdersTab()],
            ),
          );
        },
      ),
    );
  }
}

class AcceptedOrdersTab extends StatelessWidget {
  const AcceptedOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersViewmodel>(
      builder: (context, provider, child) {
        final orderdata = provider.acceptedOrderData.orders;

        if (orderdata.isEmpty) {
          return const Center(child: Text("No Accepted Orders"));
        }

        return ListView.builder(
          itemCount: orderdata.length,
          itemBuilder: (context, index) {
            final order = orderdata[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0).r,
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
                    'Accepted Order #${order.id}',
                    style: GoogleFonts.poppins(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Delivered : ${order.actualDeliveryTime ?? "Pending"}',
                    style: GoogleFonts.poppins(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class RejectedOrdersTab extends StatelessWidget {
  const RejectedOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersViewmodel>(
      builder: (context, provider, child) {
        final orders = provider.rejectedOrderData.orders;
        if (orders.isEmpty) {
          return const Center(child: Text("No Rejected Orders"));
        }

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0).r,
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
                    "assets/images/rejectorder.png",
                    height: 30.h,
                    width: 40.w,
                    color: Colors.red.shade400,
                  ),
                  title: Text(
                    'Rejected Order #${order.id}',
                    style: GoogleFonts.poppins(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Rejected on: ${order.createdAt}',
                    style: GoogleFonts.poppins(
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryBlack,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
