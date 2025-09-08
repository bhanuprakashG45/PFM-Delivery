import 'package:priya_freshmeats_delivery/res/components/toast_helper.dart';
import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/home_vm/home_viewmodel.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentIndex;

  final List<String> labels = ['Home', 'Scan', 'Orders', 'Profile'];

  final List<Widget> _pages = [
    HomeScreen(),
    QRScanOrGalleryScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        height:
            20.h +
            kBottomNavigationBarHeight +
            MediaQuery.of(context).padding.bottom,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ).r,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, -1),
            ),
          ],
        ),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (i) {
            final isSelected = currentIndex == i;
            return Expanded(
              child: InkWell(
                onTap: () {
                  if (i == 1) {
                    final provider = Provider.of<HomeViewmodel>(
                      context,
                      listen: false,
                    );
                    if (!provider.isOnline) {
                      ToastMessage.showToast(
                        context,
                        message: "Go Online for Scan Order",
                        icon: Icon(Icons.info, color: colorScheme.primary),
                      );
                      return;
                    }
                  }

                  setState(() {
                    currentIndex = i;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        NavbarIcons.values[i],
                        size: 24.sp,
                        color:
                            isSelected
                                ? colorScheme.primary
                                : Color(0xFF7D7C7C),
                      ),
                      Text(
                        labels[i],
                        style: GoogleFonts.poppins(
                          fontSize: isSelected ? 13.sp : 12.sp,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w600,
                          color:
                              isSelected
                                  ? colorScheme.primary
                                  : Color(0xFF7D7C7C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
