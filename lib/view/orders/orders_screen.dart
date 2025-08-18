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
    final colorscheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' My Orders',
          style: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(Icons.arrow_back),
        // ),
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
                  border: Border.all(
                    color: colorscheme.secondaryContainer,
                    width: 0.5,
                  ),
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
                              style: GoogleFonts.alata(
                                fontSize: 16.0.sp,
                                color:
                                    isOngoing ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Completed",
                              style: GoogleFonts.alata(
                                fontSize: 16.0.sp,
                                color:
                                    !isOngoing ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.w500,
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
          padding: const EdgeInsets.only(left: 10, right: 10).r,
          child: Card(
            margin: EdgeInsets.all(10).r,
            child: ListTile(
              leading: FaIcon(
                FontAwesomeIcons.motorcycle,
                color: colorscheme.primary,
              ),
              title: Text(
                'Order #00${index + 1}',
                style: GoogleFonts.alata(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Estimated Delivery: 7:00 PM',
                style: GoogleFonts.alata(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
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
          child: Card(
            margin: EdgeInsets.only(left: 10, right: 10).r,
            child: ListTile(
              leading: Image.asset(
                "assets/images/accept.png",
                color: Colors.green.shade400,
                height: 30.h,
                width: 40.w,
              ),
              title: Text(
                'Order #10${index + 1}',
                style: GoogleFonts.alata(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: Text(
                'Delivered on: 05 Aug 2025',
                style: GoogleFonts.alata(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
