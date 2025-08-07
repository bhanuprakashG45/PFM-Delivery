import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:priya_freshmeats_delivery/res/constants/color.dart';
import 'package:priya_freshmeats_delivery/res/widgets/order_details.dart';
import 'package:priya_freshmeats_delivery/utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = false;

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
      backgroundColor: colorscheme.primaryContainer,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Welcome , Bhanu",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: colorscheme.onPrimary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.profilescreen);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25).r,

                          border: Border.all(
                            color: colorscheme.onPrimary,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 25.sp,
                          color: AppColor.primaryBlack,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0.h),

                SizedBox(height: 20.0.h),
                Center(
                  child: GestureDetector(
                    onTap: () => toggleShift(!isOnline),
                    child: Container(
                      width: width * 0.8,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorscheme.secondary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30).r,
                        color: colorscheme.primaryContainer,
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
                              width: width * 0.4,
                              height: 45,
                              decoration: BoxDecoration(
                                color: isOnline ? Colors.green : Colors.red,
                                borderRadius: BorderRadius.circular(30).r,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Online",
                                    style: TextStyle(
                                      color:
                                          isOnline
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Offline",
                                    style: TextStyle(
                                      color:
                                          !isOnline
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0.sp,
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

                Container(
                  width: width * 0.9,
                  padding: EdgeInsets.all(10).r,
                  decoration: BoxDecoration(
                    color: AppColor.textWhite,
                    border: Border.all(
                      color: colorscheme.secondary,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Today's Earnings",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: colorscheme.onPrimary,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_rupee_sharp,
                            size: 30.0.sp,
                            color: colorscheme.onPrimary,
                          ),
                          Text(
                            "960",
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              color: colorscheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorscheme.onPrimary,
                                ),
                              ),

                              Text(
                                "Deliveries",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorscheme.onPrimary,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: colorscheme.onPrimary,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 25.sp,
                                  ),
                                ],
                              ),

                              Text(
                                "Rating",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorscheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0.h),
                Container(
                  width: width * 0.9,
                  padding: EdgeInsets.all(10).r,
                  decoration: BoxDecoration(
                    color: AppColor.textWhite,
                    border: Border.all(
                      color: colorscheme.secondary,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Orders",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: colorscheme.onPrimary,
                            ),
                          ),

                          Text(
                            "view all  ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: colorscheme.onPrimary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorscheme.onPrimary,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "Today Orders",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: colorscheme.onPrimary,
                                ),
                              ),
                            ],
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
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Accept",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
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
                                          color: Colors.redAccent,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "Reject",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
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

                SizedBox(height: 20.0.h),
                Center(
                  child: Text(
                    "New Orders",
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: colorscheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 10.0.h),
                isOnline
                    ? Column(
                      children:
                          orders.map((order) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 12.h),
                              width: width * 0.9,
                              padding: EdgeInsets.all(10).r,
                              decoration: BoxDecoration(
                                color: AppColor.textWhite,
                                border: Border.all(
                                  color: colorscheme.secondary,
                                  width: 0.2,
                                ),
                                borderRadius: BorderRadius.circular(10).r,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Order ID :",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.onPrimary,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "${order['id']}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.secondary,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 4.h),

                                  Row(
                                    children: [
                                      Text(
                                        "Customer :",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.onPrimary,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "${order['name']}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),

                                  Row(
                                    children: [
                                      Text(
                                        "Delivery Time :",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.onPrimary,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "${order['deliveryTime']}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.secondary,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 4.h),

                                  Row(
                                    children: [
                                      Text(
                                        " Location :",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.onPrimary,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "${order['location']}",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: colorscheme.secondary,
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
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              RoutesName.orderdetailsscreen,
                                              arguments: order['id'],
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8).r,
                                            ),
                                          ),
                                          child: Text(
                                            "Accept",
                                            style: TextStyle(
                                              color: AppColor.textWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.redAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          child: Text(
                                            "Reject",
                                            style: TextStyle(
                                              color: AppColor.textWhite,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    )
                    : Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      width: width * 0.9,
                      padding: EdgeInsets.all(10).r,
                      decoration: BoxDecoration(
                        color: AppColor.textWhite,
                        border: Border.all(
                          color: colorscheme.secondary,
                          width: 0.2,
                        ),
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.0.h),
                          FaIcon(
                            FontAwesomeIcons.motorcycle,
                            color: colorscheme.secondary,
                            size: 40.sp,
                          ),
                          Text(
                            "You are offline, please turn on your shift to see new orders.",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: colorscheme.onPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                SizedBox(height: 20.0.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
