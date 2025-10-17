import 'dart:io';
import 'package:priya_freshmeats_delivery/utils/exports.dart';
import 'package:priya_freshmeats_delivery/view_model/orders_vm/orders_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderAddressScreen extends StatefulWidget {
  final orderId;
  const OrderAddressScreen({super.key, this.orderId});

  @override
  State<OrderAddressScreen> createState() => _OrderAddressScreenState();
}

class _OrderAddressScreenState extends State<OrderAddressScreen> {
  bool isOrderAccepted = false;

  Future<void> _launchMap(double lat, double long) async {
    debugPrint("Destination lat: $lat");
    debugPrint("Destination long: $long");

    try {
      if (Platform.isIOS) {
        final Uri appleMapsUrl = Uri(
          scheme: 'https',
          host: 'maps.apple.com',
          queryParameters: {'daddr': '$lat,$long', 'dirflg': 'd'},
        );

        if (await canLaunchUrl(appleMapsUrl)) {
          await launchUrl(appleMapsUrl, mode: LaunchMode.externalApplication);
          await Future.delayed(const Duration(seconds: 5));
          setState(() {
            isOrderAccepted = true;
          });
        } else {
          debugPrint("Could not launch Apple Maps");
        }
      } else {
        final String googleMapsUrl =
            'https://www.google.com/maps/dir/?api=1&destination=$lat,$long&travelmode=driving';
        final Uri uri = Uri.parse(googleMapsUrl);

        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          await Future.delayed(const Duration(seconds: 5));
          setState(() {
            isOrderAccepted = true;
          });
        } else {
          debugPrint("Could not launch Google Maps");
        }
      }
    } catch (e) {
      debugPrint('Error launching map: $e');
    }
  }

  // Future<void> _launchMap(double lat, double long) async {
  //   debugPrint("Destination lat: $lat");
  //   debugPrint("Destination long: $long");

  //   try {
  //     Uri mapUrl;
  //     if (Platform.isIOS) {
  //       mapUrl = Uri(
  //         scheme: 'https',
  //         host: 'maps.apple.com',
  //         queryParameters: {'daddr': '$lat,$long', 'dirflg': 'd'},
  //       );
  //     } else {
  //       mapUrl = Uri.parse('geo:$lat,$long?q=$lat,$long&z=15');
  //     }

  //     if (await canLaunchUrl(mapUrl)) {
  //       await launchUrl(mapUrl, mode: LaunchMode.externalApplication);
  //       await Future.delayed(const Duration(seconds: 5));
  //       setState(() {
  //         isOrderAccepted = true;
  //       });
  //     } else {
  //       final fallbackUrl = Uri.parse(
  //         'https://www.google.com/maps/dir/?api=1&destination=$lat,$long&travelmode=driving',
  //       );
  //       if (await canLaunchUrl(fallbackUrl)) {
  //         await launchUrl(fallbackUrl, mode: LaunchMode.externalApplication);
  //         await Future.delayed(const Duration(seconds: 5));
  //         setState(() {
  //           isOrderAccepted = true;
  //         });
  //       } else {
  //         debugPrint(
  //           "Could not launch map URL: $mapUrl or fallback: $fallbackUrl",
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint('Error launching map: $e');
  //   }
  // }

  Future<void> makePhoneCall(String countrycode, String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: countrycode + phoneNumber);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    final colorscheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Order Address',
          style: GoogleFonts.poppins(
            color: AppColor.primaryBlack,
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorscheme.onPrimary,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Consumer<OrdersViewmodel>(
            builder: (context, orderdetailsprovider, child) {
              final customerdata = orderdetailsprovider.customerdata;
              return Skeletonizer(
                enabled: orderdetailsprovider.isOrderAccepting,
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
                              color: Colors.white.withValues(alpha: 0.6),
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
                                  'assets/images/acceptorder.jpeg',
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
                                        customerdata.recieverName,
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
                                      customerdata.orderDetails.isEmpty
                                          ? "Not found."
                                          : customerdata.orderDetails
                                              .map((e) => e.name)
                                              .join("\n"),
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.secondaryBlack,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          customerdata.houseNo +
                                              ", " +
                                              customerdata.location,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      isOrderAccepted
                          ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RoutesName.bottomnavbar,

                                        arguments: PageController(
                                          initialPage: 0,
                                        ),
                                        (route) => false,
                                      );
                                      await orderdetailsprovider.orderDelivered(
                                        context,
                                        widget.orderId,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green.shade400,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).r,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.thumbsUp,
                                              color: Colors.white,
                                              size: 15.sp,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "Order Delivered",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RoutesName.notDeliveredScreen,
                                        arguments: widget.orderId,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red.shade400,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).r,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.thumbsDown,
                                              color: Colors.white,
                                              size: 15.sp,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              "Not Delivered",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                          : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      debugPrint("Initiate Delivery");
                                      final lat =
                                          customerdata
                                              .geoLocation
                                              .coordinates[1];

                                      final long =
                                          customerdata
                                              .geoLocation
                                              .coordinates[0];
                                      await _launchMap(lat, long);
                                      await orderdetailsprovider
                                          .initiateDelivery(
                                            context,
                                            widget.orderId,
                                          );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: colorscheme.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15).r,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.locationDot,
                                          color: Colors.white,
                                          size: 20.sp,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          "Initiate Delivery",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final contactNumber = customerdata.phone;
                              await makePhoneCall('+91', contactNumber);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15).r,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Call Customer",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
