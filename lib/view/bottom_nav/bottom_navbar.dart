import 'package:priya_freshmeats_delivery/utils/exports.dart';

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
          color: colorScheme.surface,
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
                                : colorScheme.secondary,
                      ),
                      Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: isSelected ? 13.sp : 12.sp,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w600,
                          color:
                              isSelected
                                  ? colorScheme.primary
                                  : colorScheme.secondary,
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
