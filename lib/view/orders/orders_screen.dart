import 'package:priya_freshmeats_delivery/utils/exports.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isOngoing = true;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' My Orders',
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
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
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
                'Order #00${index + 1}',
                style: GoogleFonts.poppins(
                  color: AppColor.primaryBlack,
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Estimated Delivery: 7:00 PM',
                style: GoogleFonts.poppins(
                  color: AppColor.secondaryBlack,
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // trailing: Text(
              //   'OnGoing',
              //   style: GoogleFonts.alata(
              //     fontSize: 16.0.sp,
              //     color: Colors.amber,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            ),
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
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
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
                'Order #10${index + 1}',
                style: GoogleFonts.poppins(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Delivered on: 05 Aug 2025',
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
  }
}
