import 'package:priya_freshmeats_delivery/utils/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = true;

  void toggleShift(bool value) {
    setState(() {
      isOnline = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome , Bhanuprakash",
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryBlack,
          ),
          textAlign: TextAlign.start,
        ),
        automaticallyImplyLeading: false,
        surfaceTintColor: colorscheme.surface,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () => toggleShift(!isOnline),
                    child: Container(
                      width: width * 0.9,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorscheme.secondaryContainer,
                          width: 0.5,
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
                            duration: Duration(milliseconds: 200),
                            child: Container(
                              width: width * 0.425,
                              height: 45.h,
                              decoration: BoxDecoration(
                                color:
                                    isOnline
                                        ? Colors.green.shade400
                                        : Colors.red.shade400,
                                borderRadius: BorderRadius.circular(20).r,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Online",
                                    style: GoogleFonts.alata(
                                      color:
                                          isOnline
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.0.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Offline",
                                    style: GoogleFonts.alata(
                                      color:
                                          !isOnline
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.w500,
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

                Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 18.0.h,
                              width: 5.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10).r,
                                color: colorscheme.primaryContainer,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "Orders",
                              style: GoogleFonts.alata(
                                fontSize: 22.0.sp,
                                fontWeight: FontWeight.w400,
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
                                style: GoogleFonts.alata(
                                  fontSize: 16.sp,
                                  // fontWeight: FontWeight.bold,
                                  color: AppColor.primaryBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "10",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primaryBlack,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "Today Orders",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: colorscheme.secondary,
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
                                      dataMap: {"Accept": 7, "Reject": 3},
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
                                      chartValuesOptions: ChartValuesOptions(
                                        showChartValues: false,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: colorscheme.secondary,
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
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: colorscheme.secondary,
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
                isOnline
                    ? Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 18.0.h,
                                  width: 5.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10).r,
                                    color: colorscheme.primaryContainer,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "OnGoing Order",
                                  style: GoogleFonts.alata(
                                    fontSize: 22.0.sp,
                                    fontWeight: FontWeight.w400,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          "JP Nagar, Bangalore, Karnataka",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: colorscheme.secondary,
                                          ),
                                          textAlign: TextAlign.start,
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
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.secondary,
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
                    )
                    : Card(
                      elevation: 1,
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
                                    height: 18.0.h,
                                    width: 5.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10).r,
                                      color: colorscheme.primaryContainer,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Expanded(
                                    child: Text(
                                      "No Ongoing Order",
                                      style: GoogleFonts.alata(
                                        fontSize: 22.0.sp,
                                        fontWeight: FontWeight.w400,
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
                                  "Please go online to receive orders",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: colorscheme.secondary,
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
      ),
    );
  }
}
