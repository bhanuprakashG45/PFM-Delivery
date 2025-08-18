import 'package:priya_freshmeats_delivery/utils/exports.dart';

class ViewallOrdersScreen extends StatefulWidget {
  const ViewallOrdersScreen({super.key});

  @override
  State<ViewallOrdersScreen> createState() => _ViewallOrdersScreenState();
}

class _ViewallOrdersScreenState extends State<ViewallOrdersScreen> {
  bool isAccepted = true;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Orders',
          style: GoogleFonts.alata(
            fontSize: 25.0.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.0).r,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isAccepted = !isAccepted;
                  _pageController.animateToPage(
                    isAccepted ? 0 : 1,
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
                          isAccepted
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                      duration: const Duration(milliseconds: 250),
                      child: Container(
                        width: width * 0.425,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color:
                              isAccepted
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
                              style: GoogleFonts.alata(
                                fontSize: 18.0.sp,
                                color:
                                    isAccepted ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Rejected",
                              style: GoogleFonts.alata(
                                fontSize: 18.0.sp,
                                color:
                                    !isAccepted ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
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
            isAccepted = index == 0;
          });
        },
        children: const [AcceptedOrdersTab(), RejectedOrdersTab()],
      ),
    );
  }
}

class AcceptedOrdersTab extends StatelessWidget {
  const AcceptedOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0).r,
          child: Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/accept.png",
                color: Colors.green.shade400,
                height: 30.h,
                width: 40.w,
              ),
              title: Text(
                'Accepted Order #A0${index + 1}',
                style: GoogleFonts.alata(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Delivered : Aug 5 2025 at 6:30 PM',
                style: GoogleFonts.alata(fontSize: 16.0.sp),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RejectedOrdersTab extends StatelessWidget {
  const RejectedOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0).r,
          child: Card(
            child: ListTile(
              leading: Image.asset(
                "assets/images/rejectorder.png",
                height: 30.h,
                width: 40.w,
                color: Colors.red.shade400,
              ),
              title: Text(
                'Rejected Order #R0${index + 1}',
                style: GoogleFonts.alata(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Rejected on: 07 Aug 2025',
                style: GoogleFonts.alata(fontSize: 16.0.sp),
              ),
            ),
          ),
        );
      },
    );
  }
}
